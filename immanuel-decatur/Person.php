<?php
declare(strict_types=1);

class Person {

    public function __construct(
        public string $fname   = 'unknown', 
        public string $lname   = 'unknown',
        public string $sex     = 'u',
        public int    $fid     = 1,
        public int    $mid     = 1,
        public string $bdate   = "1000-01-01",
        public bool   $founder = false,
        public string $bdorf   = 'unspecified',
        public string $bkreis  = 'unspecified',
        public string $bland   = 'unspecified',
        )
        {}

     static public function newPerson(string $fname, string $lname, string $sex) : Person
     {
          return new Person($fname, $last, $sex);  
     } 

     public function __toString() : string
     {
      echo 'fname   = ' . $this->fname . "\n";
      echo 'lname   = ' . $this->lname . "\n";
      echo 'sex     = ' . $this->sex . "\n";
      echo 'fid     = ' . $this->fid . "\n";
      echo 'mid     = ' . $this->mid . "\n";
      echo 'bdate   = ' . $this->bdate . "\n";
      echo 'founder = ' . $this->founder . "\n";
      echo 'bdorf   = ' . $this->bdorf . "\n";
      echo 'bkreis  = ' . $this->bkreis . "\n";
      echo 'bland   = ' . $this->bland . "\n";
     }
/*
     public function insert(\PDO\Statement $stmt)
     {
	$stmt->execute([
'fname' =>         $this->fname .
'lname' =>         $this->lname .
'sex' =>           $this->sex . "
'fid' => 	   $this->fid . "
'mid' => 	   $this->mid . "
'bdate' =>         $this->bdate .
'bdorf' =>         $this->bdorf .
'bkreis' =>        $this->bkreis 
'bland' =>         $this->bland .
'founder' =>       $this->founder
*/
}
