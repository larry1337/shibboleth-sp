<?php
        $var = "ILIAS_SHIB_AFFILIATION";

        $allowedRoles = array('student', 'professor', 'guest', 'administrator');
        $result = array();

        if(isset($_SERVER[$var])) {
                for ($i = 0; $i < sizeof($allowedRoles); $i++)
                {
                        $value = $allowedRoles[$i];
                        if(preg_match("/\b" . $value . "\b/i", $_SERVER[$var])) 
                        {
                                $result[] = $value;

                        }
                }
        }
        $_SERVER[$var] = $result;
?>
