<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 * @author Ogawa ogawa@tejimaya.com
 * @author Masaki Miyashita miyasita@zenzy.net
 */

// PEAR::Mail_mimeDecode
require_once 'Mail/mimeDecode.php';
require_once 'util.inc.php';

/**
 * OpenPNE_KtaiMail
 * 携帯メール用のメールデコーダ
 */
class OpenPNE_KtaiMail
{
    /**
     * デコード結果
     * @var stdClass
     */ 
    var $mail;

    /** @var string 変換元文字エンコーディング(デフォルト値) */
    var $from_encoding = 'auto';

    /** @var string 変換先文字エンコーディング */
    var $to_encoding = 'UTF-8';

    /** @var string 画像検証用のテンポラリディレクトリ */
    var $img_tmp_dir;

    /** @var string 画像検証用のテンポラリファイルの接頭辞 */
    var $img_tmp_prefix = 'OpenPNE_KtaiMail_';

    /** @var string 画像の最大ファイルサイズ(byte) */
    var $img_max_filesize;

    /** @var bool 全角スペースを削除するかどうか */
    var $trim_doublebyte_space = true;

    /**
     * constructor
     * 
     * @access public
     * @param string $options
     *      - from_encoding    : 変換元文字エンコーディング
     *      - to_encoding      : 変換先文字エンコーディング
     *      - img_tmp_dir      : 画像検証用のテンポラリディレクトリ
     *      - img_tmp_prefix   : 画像検証用のテンポラリファイルの接頭辞
     *      - img_max_filesize : 画像の最大ファイルサイズ
     *      - trim_doublebyte_space : 全角スペースを削除するかどうか
     */
    function OpenPNE_KtaiMail($options = array())
    {
        foreach ($options as $key => $value) {
            switch ($key) {
            case 'from_encoding':
                $this->from_encoding = $value;
                break;
            case 'to_encoding':
                $this->to_encoding = $value;
                break;
            case 'img_tmp_dir':
                $this->img_tmp_dir = $value;
                break;
            case 'img_tmp_prefix':
                $this->img_tmp_prefix = $value;
                break;
            case 'img_max_filesize':
                $this->img_max_filesize = $value;
                break;
            case 'trim_doublebyte_space':
                $this->trim_doublebyte_space = (bool)$value;
                break;
            }
        }
    }

    /**
     * メールをデコード
     * 
     * @access public
     * @param string メールの生データ
     */
    function decode($raw_mail)
    {
        $params['include_bodies'] = true;
        $params['decode_bodies']  = true;
        $params['decode_headers'] = true;
        $params['input'] = $raw_mail;

        $this->mail =& Mail_mimeDecode::decode($params);
    }

    /**
     * ヘッダー(From:)から送信元メールアドレスを取得
     * 
     * @access public
     * @return string Fromメールアドレス
     */
    function get_from()
    {
        return $this->_get_mail_address($this->mail->headers['from']);
    }

    /**
     * ヘッダー(To:)から宛先メールアドレスを取得
     * 
     * @access public
     * @return string Toメールアドレス
     */
    function get_to()
    {
        return $this->_get_mail_address($this->mail->headers['to']);
    }

    /**
     * Subject の内容を抽出(＋文字コード変換)
     * 
     * @access public
     * @return string Subject
     */
    function get_subject()
    {
        return isset($this->mail->headers['subject']) ?
                    $this->convert_text($this->mail->headers['subject']) : '';
    }

    /**
     * メール本文からテキストを抽出(＋文字コード変換)
     * 
     * @access public
     * @return string メール本文のテキスト
     */
    function get_text_body()
    {
        return $this->_get_text_body($this->mail);
    }

    /** @access private */
    function _get_text_body(&$mail)
    {
        $body = '';

        if (isset($mail->parts) && is_array($mail->parts)) {
            // multipart
            foreach ($mail->parts as $part) {
                if ($body = $this->_get_text_body($part)) break;
            }
        } elseif (strtolower($mail->ctype_primary) === 'text' &&
                  strtolower($mail->ctype_secondary) === 'plain') {
            $body = $mail->body;
            $charset = $mail->ctype_parameters['charset'];

            $body = $this->convert_text($body, $charset);
        }

        return $body;
    }

    /**
     * メールから画像データを抽出
     * 
     * @access public
     * @return array 画像データ配列
     */
    function get_images()
    {
        return $this->_get_images($this->mail);
    }

    /** @access private */
    function _get_images(&$mail)
    {
        $allowed_type = array('jpeg', 'gif', 'png');
        $images = array();

        if (isset($mail->parts) && is_array($mail->parts)) {
            // multipart
            foreach ($mail->parts as $part) {
                $images = array_merge($images, $this->_get_images($part));
            }
        } elseif (strtolower($mail->ctype_primary) === 'image' &&
                  in_array(strtolower($mail->ctype_secondary), $allowed_type)) {
            $image_data = $mail->body;
            $image_ext = '';

             // 画像かどうかチェック
            if (!@imagecreatefromstring($image_data)) {
                // base64_decodeしてリトライ
                $image_data = base64_decode($image_data);
                if (!@imagecreatefromstring($image_data)) {
                    return array();
                }
            }

            // 一時ファイルを作成
            $tmpfname = tempnam($this->img_tmp_dir, $this->img_tmp_prefix);

            $fp = fopen($tmpfname, 'wb');
            fwrite($fp, $image_data);
            fclose($fp);

            // 画像サイズのチェック
            if ($this->img_max_filesize && filesize($tmpfname) > $this->img_max_filesize) {
                unlink($tmpfname);
                return array();
            }

            // 画像のリサイズ
            list($width, $height, $type, $attr) = @getimagesize($tmpfname);
            $need_resize = false;
            $original_width = $width;
            $original_height = $height;
            //横のサイズが、指定されたサイズより大きい場合
            if (IMAGE_MAX_WIDTH && ($width > IMAGE_MAX_WIDTH)) {
                $need_resize = true;
                $height = $height * (IMAGE_MAX_WIDTH / $width);
                $width = IMAGE_MAX_WIDTH;
            }
            //縦サイズが、指定されたサイズより大きい場合
            if (IMAGE_MAX_HEIGHT && ($height > IMAGE_MAX_HEIGHT)) {
                $need_resize = true;
                $width = $width * (IMAGE_MAX_HEIGHT / $height);
                $height = IMAGE_MAX_HEIGHT;
            }
            if ($height < 1.) {
                $height = 1;
            }
            if ($width < 1.) {
                $width = 1;
            }
            if ($need_resize) {
                resize_image($type, $tmpfname, $tmpfname, $original_width, $original_height, $width, $height);
                $fp = fopen($tmpfname, 'rb');
                $image_data = fread($fp, filesize($tmpfname));  // 一時ファイルを再度読み込み
                fclose($fp);
            }

            // 画像が正しいかどうかチェック
            switch (strtolower($mail->ctype_secondary)) {
            case 'jpeg':
                if (!@imagecreatefromjpeg($tmpfname)) {
                    $image_data = '';
                } else {
                    $image_ext = 'jpg';
                }
                break;
            case 'gif':
                if (!@imagecreatefromgif($tmpfname)) {
                    $image_data = '';
                } else {
                    $image_ext = 'gif';
                }
                break;
            case 'png':
                if (!@imagecreatefrompng($tmpfname)) {
                    $image_data = '';
                } else {
                    $image_ext = 'png';
                }
                break;
            }
            unlink($tmpfname);

            if ($image_data && $image_ext) {
                $images = array(array('data' => $image_data, 'ext' => $image_ext));
            }
        }

        return $images;
    }

    /**
     * 文字列からメールアドレスを抽出
     * 
     * @access private
     * @param string $str 入力文字列
     * @return string メールアドレス
     */
    function _get_mail_address($str)
    {
        if (!$str) {
            return false;
        }

        // "(ダブルクォーテーション)を取り除く
        // "example"@docomo.ne.jp
        $str = str_replace('"', '', $str);

        $bkup = $str;
        $ar = split(',', $str);
        $cnt = count($ar);
        if($cnt < 2){
            $str = $bkup;
            // <example@docomo.ne.jp> というアドレスになることがある。
            //   日本語 <example@docomo.ne.jp>
            // のような場合に複数マッチする可能性があるので、
            // マッチした最後のものを取ってくるように変更
            $matches = array();
            $regx = '/([\.\w!#$%&\'*+\-\/=?^`{|}~]+@[\w!#$%&\'*+\-\/=?^`{|}~]+(\.[\w!#$%&\'*+\-\/=?^`{|}~]+)*)/';
            if (preg_match_all($regx, $str, $matches)) {
                return array_pop($matches[1]);
            }
        } else {
            $regx = '/([\.\w!#$%&\'*+\-\/=?^`{|}~]+@[\w!#$%&\'*+\-\/=?^`{|}~]+(\.[\w!#$%&\'*+\-\/=?^`{|}~]+)*)/';
            for($i = 0; $i < $cnt; $i++) {
                $matches = array();
                if (preg_match_all($regx, $ar[$i], $matches)) {
                    $to = array_pop($matches[1]);
                    list($to_user0, $to_host0) = explode("@", $to, 2);
                if($to_host0 === MAIL_SERVER_DOMAIN) {
                    return $to;
                }
            }
        }
    }

        return false;
    }

    function convert_text_core($str)
    {
        $converted_text = "";
        $res = preg_split("/JIS\+..../", $str, -1 ,PREG_SPLIT_OFFSET_CAPTURE) ;

        for ($i = 0; $i < count($res); $i++) {
            if ($i == 0) {
                $begin = strlen($res[$i][0]);
                $converted_text .= $res[$i][0];
            } else {
                $jis = substr($str, $begin, 8);

                // $jisを変換
                $a = "0x" . substr($jis, 4, 2);
                $b = "0x" . substr($jis, 6, 2);
                {
                    // http://www.slayers.ne.jp/~oouchi/code/jistosjis.html
                    $a = intval($a, 16);
                    $b = intval($b, 16);
                    if($a % 2 == 1) {
                        $b += 0x1f;
                    } else {
                        $b += 0x7d;
                    }

                    if($b >= 0x7f) {
                        $b++;
                    }
    
                    $a = floor(($a-0x21) / 2) + 0x81;

                    if ($a >= 0x9e) {
                        $a+=0x40;
                    }

                    $c = $a * 16 * 16 + $b;
                    if($c >= 0xEDCF || ($c >= 0xED40 && $c <= 0xEDCE)) {
                        $c += 1536;
                    } else {
                        $c += 2816;
                    }

                    // 絵文字変換
                    $bin[0] = chr($c >> 8);
                    $bin[1] = chr($c - ($bin[0] << 8));
                    $emoji = emoji_escape_e($bin);

                    $converted_text .= $emoji;
                }

                //Eメール送出用Shift-JIS(E-SJIS)と携帯用Shift-JISコード(K-SJIS)には以下の関係がある
                // * 358 <= 絵文字番号 <= 499, 700 <= 絵文字番号
                // hexdec(K-SJIS) = hexdec(E-SJIS) + 1536
                // * それ以外の絵文字
                // hexdec(K-SJIS) = hexdec(E-SJIS) + 2816
                $begin = strlen($res[$i][0]) + $res[$i][1];
                $converted_text .= $res[$i][0];
            }
        }
      return $converted_text;
    }
  
    /**
     * 文字エンコーディングの変換、空白文字の削除
     * 
     * @access public
     * @param string $str 変換前の文字列
     * @param string $from_encoding
     * @param string $to_encoding
     * @return string 変換後の文字列
     */
    function convert_text($str, $from_encoding = '', $to_encoding = '')
    {
        if (!$from_encoding) $from_encoding = $this->from_encoding;
        if (!$to_encoding)   $to_encoding = $this->to_encoding;


        if ($GLOBALS['__Framework']['carrier'] != 's') {
            mb_substitute_character("long");
            $str = mb_convert_encoding($str, $to_encoding, $from_encoding);
            $str = $this->convert_text_core($str);
        } else {
            $str = mb_convert_encoding($str, $to_encoding, $from_encoding);
        }

        // 空白文字の削除
        $str = str_replace("\0", '', $str);
        if ($this->trim_doublebyte_space) {
            $str = mb_ereg_replace('([\s　])+$', '', $str);
        } else {
            $str = rtrim($str);
        }

        return $str;
    }
}

?>