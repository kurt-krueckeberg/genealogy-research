#!/usr/bin/env php
<?php

/*
if (count($argv) !== 2) {

  echo "Enter the input file name.\n";
  return;

}

$pre = substr($argv[1], 0, strpos($argv[1], "."));

$out = "$pre.html";
*/
if ($argc !== 2)
  die ("No input files.\n");

else if (!file_exists($argv[1]))
  die ($argv[1] . " does not exist.\n");

$cmd = "a " . $argv[1] . " -a stylesheet=./skins/dark.css -o ~/k/temp/new.html";

exec($cmd);