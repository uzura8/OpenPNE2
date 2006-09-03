<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

$GLOBALS['_OPENPNE_DB_LIST'] = array();

function &db_get_instance($name = 'main', $readonly = false)
{
    global $_OPENPNE_DB_LIST;

    if (empty($_OPENPNE_DB_LIST[$name])) {
        if (!$dsn = db_get_dsn($name)) {
            if ($name == 'main') {
                return false;
            } else {
                return db_get_instance();
            }
        }
        if ($readonly) {
            $_OPENPNE_DB_LIST[$name] =& new OpenPNE_DB($dsn);
        } else {
            $_OPENPNE_DB_LIST[$name] =& new OpenPNE_DB_Writer($dsn);
        }
    }
    return $_OPENPNE_DB_LIST[$name];
}

function db_get_dsn($name = 'main')
{
    global $_OPENPNE_DSN_LIST;

    if (empty($_OPENPNE_DSN_LIST[$name])) {
        return false;
    }
    $item = $_OPENPNE_DSN_LIST[$name];

    if (empty($item['dsn'])) {
        // priority に応じた確率で1件取得
        $entries = array();
        foreach ($item as $i) {
            if (empty($i['dsn'])) continue;

            $p = !empty($i['priority']) ? intval($i['priority']) : 1;
            $entries = array_pad($entries, count($entries) + $p, $i);
        }
        if ($entries) {
            $key = array_rand($entries);
            $item = $entries[$key];
        }
    }

    return $item['dsn'];
}

function db_get_one($sql, $params = array())
{
    $reader =& db_get_instance('main_reader', true);
    return $reader->get_one($sql, $params);
}

function db_get_row($sql, $params = array())
{
    $reader =& db_get_instance('main_reader', true);
    return $reader->get_row($sql, $params);
}

function db_get_col($sql, $params = array())
{
    $reader =& db_get_instance('main_reader', true);
    return $reader->get_col($sql, $params);
}

function db_get_col_limit($sql, $from, $count, $params = array())
{
    $reader =& db_get_instance('main_reader', true);
    return $reader->get_col_limit($sql, $from, $count, $params);
}

function db_get_col_page($sql, $page, $count, $params = array())
{
    $reader =& db_get_instance('main_reader', true);
    return $reader->get_col_page($sql, $page, $count, $params);
}

function db_get_assoc($sql, $params = array())
{
    $reader =& db_get_instance('main_reader', true);
    return $reader->get_assoc($sql, $params);
}

function db_get_assoc_limit($sql, $from, $count, $params = array())
{
    $reader =& db_get_instance('main_reader', true);
    return $reader->get_assoc_limit($sql, $from, $count, $params);
}

function db_get_all($sql, $params = array())
{
    $reader =& db_get_instance('main_reader', true);
    return $reader->get_all($sql, $params);
}

function db_get_all_limit($sql, $from, $count, $params = array())
{
    $reader =& db_get_instance('main_reader', true);
    return $reader->get_all_limit($sql, $from, $count, $params);
}

function db_get_all_page($sql, $page, $count, $params = array())
{
    $reader =& db_get_instance('main_reader', true);
    return $reader->get_all_page($sql, $page, $count, $params);
}

function db_quote($str)
{
    $db =& db_get_instance('main_reader', true);
    return $db->quote($str);
}

function db_escapeIdentifier($str)
{
    return OpenPNE_DB::escapeIdentifier($str);
}

function db_query($sql, $params = array())
{
    $db =& db_get_instance();
    return $db->query($sql, $params);
}

function db_insert($table_name, $fields_values, $pkey = null)
{
    if (is_null($pkey)) { // primary key 自動生成
        $pkey = $table_name . '_id';
    }
    $db =& db_get_instance();
    return $db->insert($table_name, $fields_values, $pkey);
}

function db_update($table_name, $fields_values, $where)
{
    $db =& db_get_instance();
    return $db->update($table_name, $fields_values, $where);
}

function db_affected_rows()
{
    $db =& db_get_instance();
    return $db->affectedRows();
}

function db_now()
{
    return date('Y-m-d H:i:s');
}

?>
