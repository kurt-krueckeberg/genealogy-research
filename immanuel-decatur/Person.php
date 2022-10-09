<?php
declare(strict_types=1);

require_once "sex.php";

class Person { // struct

    static private string $sql = "INSERT INTO person (fname, lname, sex, fid, mid, bdate, bdorf, bkreis, bland, founder) VALUES (:fname, :lname, :sex, :fid, :mid, :bdate, :bdorf, :bkreis, :bland, :founder)";

    private $stmt;

 public function __construct(\PDO $pdo,
    public string $lname='',
    public string $sex=sex::unknown,
    public int 	  $fid=1,
    public int    $mid=1,
    public string $bdate='1000-01-01',
    public bool   $founder=false,
    public string $bdorf='unspecified',
    public string $bkreis='unspecified',
    public string $bland='unspecified') 
    {

        $this->stmt = $pdo->prepare(self::$sql);

	$stmt->bindValue('fname', $this->fname);
	$stmt->bindValue('lname', $this->lname);
	$stmt->bindValue('sex',   $this->sex);
	$stmt->bindValue('fid', $this->fid, PDO::PARAM_INT);
	$stmt->bindValue('mid', $this->mid, PDO::PARAM_INT);
	$stmt->bindValue('bdate', $this->bdate);
	$stmt->bindValue('founder', $this->founder, PDO::PARAM_BOOL);
	$stmt->bindValue('bdorf', $this->bdorf);
	$stmt->bindValue('bkreis', $this->bkreis);
	$stmt->bindValue('bland', $this->bland);
    }  

    // todo: Add optional parameters--decide which are required and which optionsl.
    public function insert(string $fname, string $lname, sex $sex, int $fid=1, int $mid=1, string $bdate='1000-01-01', bool $found=false, string $bdorf = 'unspecified', string $kreis = 'unspecified', string $bland = 'unspecified') : bool 
    {
	$this->fname   = $fname;
	$this->lname   = $lname;
	$this->sex     = $sex;
	$this->fid     = $fid;
	$this->mid     = $mid;
	$this->bdate   = $bdate;
	$this->founder = $founder;
	$this->bdorf   = $bdorf;
	$this->bkreis  = $bkreis;
	$this->bland   = $bland;

        $rc =  $this->stmt->execute();
    }
    
    public function date(string $date) // Must be in format of "month-name day, year"
    {
         $this->date = date($date); //??
    }
}
