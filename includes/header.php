<?php
require_once "./includes/core/helper.php";
?>


<header>

    <div class="headWrap">
        <a href="/" class="white">
        <h1>my Web Project</h1>
        <p>Coding is fun</p>
        </a>
    </div>


</header>
<nav id="ticker">
    <div class="line">
        <?php foreach(getNews() as $news){
        ?>
        <span>
            <a title="<?=$news['title'];?>" href="<?=$news['url'];?>"><?=$news['title'];?></a>
        </span>
            <span>+++</span>
        <?php
        }
        ?>
    </div>
</nav>
