<?php
declare(strict_types=1);


class Person { // struct

 public function __construct(public string $fname,
    public string $lname,
    public string $sex,
    public int $fid=1,
    public int $mid=1,
    public string $bdate='1000-01-01',
    public bool $founder=false,
    public string $bdorf='unspecified',
    public string $bkreis='unspecified',
    public string $bland='unspecified') {}  

  }
$p = new Person('unkown', 'unknown', 'm');

$a =(array) $p;

print_r($a);
