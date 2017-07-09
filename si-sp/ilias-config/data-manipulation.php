<?php
        $var = "HTTP_SHIB_AFFILIATION";
        if(isset($_SERVER[$var])) {
                $_SERVER[$var] = explode(";", $_SERVER[$var]);
        }
?>
