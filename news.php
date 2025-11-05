<?php
require_once "./php/helper.php";

if(!isset($_GET['id'])){
    echo "Keine Id gegeben!";exit;
}
$item = getNewsItem((int)$_GET['id']); //SQL Injection wird durch typecasting verhindert!
?>

<!DOCTYPE html>
<html dir="ltr" lang="de">
<head>
    <?php
    include('./includes/head.php') ?>
    <title><?=$item['title'];?></title>
</head>
<body>
<div class="wrap">
    <?php include('./includes/header.php')?>
    <article class="news page">
        <?php
        if(null === $item){
        ?>
            <h2>Kann den News-Beitrag nicht laden</h2>
        <?php
        }else{
        ?>
        <h2 class="primary"><?=$item['title'];?></h2>
            <time><?=$item['datetime'];?></time>
            <p>
                <?=textToHtml($item['content']);?>
            </p>



        <?php
        }
        ?>
    </article>
    <?php include('./includes/footer.php')?>
</div>


</body>
</html>
