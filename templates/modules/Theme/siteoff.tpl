<?php
header("HTTP/1.1 503 Service Temporarily Unavailable");
header("Status: 503 Service Temporarily Unavailable");
header("Retry-After: 3600");
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Wartungsarbeiten</title>
    <style>
        h1 {
            font-size: 50px;
        }
        body {
            background:white;
            font: 20px Helvetica, sans-serif;
            color: #333;
            text-align: center;
            padding: 10%;
        }
        article {
            display: block;
            text-align: left;
            width: 100%;
            max-width: 1000px;
            margin: 0 auto;
        }
        a {
            color: #dc8100;
            text-decoration: none;
        }
        a:hover {
            color: #333;
            text-decoration: none;
        }
        img {
            float: left;
            margin-right: 20px;
            margin-top: 15px;
            height: 230px;
        }
        @media (max-width: 899px) {
            img {
                display: none;
            }
        }
            @media (max-width: 399px) {
            h1 {
                font-size: 30px;
            }
            p {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
<article>
    <img src="themes/EventManager/images/KSL Wappen.png" alt="KSL Logo"/>
    <h1>Wir sind bald zurück!</h1>
    <div>
        <p><?php echo System::getVar('siteoffreason'); ?></p>
        <p>&mdash; Das EventManager Team</p>
    </div>
    <?php if (isset($_GET['login'])) { ?>
    <div style="clear: both"></div>
    <hr />
    <h5>Admin Login</h5>
    <form id="login" action="<?php System::getVar('entrypoint', 'index.php'); ?>?module=Users&amp;type=user&amp;func=siteofflogin" method="post">
        <div>
            <div class="loginrow">
                <label for="user"><?php echo __('User name'); ?></label>
                <input id="user" type="text" name="user" size="14" maxlength="64" />
            </div>
            <div class="loginrow">
                <label for="pass"><?php echo __('Password'); ?></label>
                <input id="pass" type="password" name="pass" size="14" maxlength="20" />
            </div>
            <div class="loginbutton">
                <input class="login-button" type="submit" value="<?php echo __('Log in'); ?>" />
            </div>
        </div>
    </form>
    <?php } ?>
</article>
</body>
</html>