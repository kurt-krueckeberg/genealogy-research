<?php
use \SplFileObject as File;

$find = array("DWWD", "FWDG", "FWDJ", "FWDN", "FWDS", "FWDT", "FWJ", "FWMG", "FWMJ", "FWS", "FTSt", "FWT", "FWTP", "FWWD", "FWWS", "JEFF");

$repl = array( "Fort Wayne Daily Democrat", "Fort Wayne Daily Gazette", "Fort Wayne Daily Journal", "Fort Wayne Daily News", "Fort Wayne Daily Sentinel", "Fort Wayne Daily Times", "Fort Wayne Journal", "Fort Wayne Morning Gazette", "Fort Wayne Morning Journal", "Fort Wayne Sentinel", "Fort Wayne Standard", "Fort Wayne Times", "Fort Wayne Times & Peoples Press", "Fort Wayne Weekly Democrat", "Fort Wayne Weekly Sentinel", "Jeffersonian");

$in = new File("./obits-benders-others.adoc", "r");
$out = new File("./output.adoc", "w");

foreach($in as $line) {

 $x = str_replace($find, $repl, $line);
 $out->fwrite($x);
}
