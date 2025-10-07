<?php
require_once "./includes/core/config.php";

require_once "./includes/core/db.php";


function textToHtml(string $text): string {

    $text = htmlspecialchars($text, ENT_QUOTES, 'UTF-8');

    $text = str_replace("\r\n", "\n", $text); //Windoof / Linux
    $paragraphs = explode("\n\n", $text);
    $html = '';
    foreach ($paragraphs as $p) {
        $html .= '<p>' . nl2br($p, false) . '</p>';
    }
    return $html;
}

function simpleSlugify(string $text):string {
    $text = strtolower($text);

    if (function_exists('iconv')) {
        $text = iconv('UTF-8', 'ASCII//TRANSLIT', $text);
    }
    $text = preg_replace('/[^a-z0-9]+/', '-', $text);

    $text = preg_replace('/-+/', '-', $text);
    return trim($text, '-');
}
function transformNewsItem(array $item):array{
    $item['datetime'] = date("d.m.Y H:i;s",strtotime($item['datetime']));
    $slug = simpleSlugify($item['title']);
    $item['url'] = '/news/'.$item['id'].'/'.$slug;
    return $item;
}
function getNewsItem(int $id):?array{
    try{
        $data  =  (DB::getInstance())->select(
            "Select * from news WHERE id=" . $id . " LIMIT 1"
        );
        if(count($data) === 0){
            return null;
        }
        return transformNewsItem($data[0]);
    }catch (Exception $e){
        return null;
    }
}



function getNews():array{
    try{
        $data  =  (DB::getInstance())->select("Select * from news  ORDER BY datetime DESC LIMIT 0,6");
        return array_map('transformNewsItem',$data);

    }catch (Exception $e){
        return [];
    }
}
