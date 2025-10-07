<?php
require_once "./includes/core/helper.php";
?>
<!DOCTYPE html>
<html dir="ltr" lang="de">
<head>
    <?php
    include('./includes/head.php') ?>

    <title>Startseite</title>
</head>
<body>
        <div class="wrap">
            <?php include('./includes/header.php')?>
            <main>
                <h2 class="primary">Die neusten News rund um mich und meine Arbeit</h2>
                <p class="pv">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet aspernatur assumenda at dolorem, minima officiis quaerat quis repellat repudiandae similique? Aliquid architecto atque fugit nemo omnis quasi qui reprehenderit voluptate.</p>

                <section id="cards">


                    <?php
                    foreach(getNews() as $news){
                        ?>
                        <article class="card">
                            <h3><?=$news['title'];?></h3>
                            <time><?=$news['datetime'];?></time>
                            <p><?=substr($news['content'],0,200);?>...</p>
                            <a title="<?=$news['title'];?>" href="<?=$news['url'];?>">mehr lesen...</a>
                        </article>
                        <?php
                    }
                    ?>
                </section>
            </main>
            <?php include('./includes/footer.php')?>
        </div>


</body>
</html>
