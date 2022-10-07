<?php
declare(strict_types=1);

class PersonStmt {

     private \PDOSatement $stmt;

     public function __construct(\PDO $pdo, Person $p)
     {
        $this->stmt = $pdo->prepare('insert into person(fname, lname, sex, fid, mid, bdate, founder, bdorf, bkreis, bland values(:fname, :lname, :sex, :fid, :mid, :bdate, :founder, :bdorf, :bkreis, :bland)');
     }

// See https://www.php.net/manual/en/pdostatement.execute.php
     public function insert(Person $p)
     {
        //$ser = serialize($p);

        //$this->stmt->execute((array) $ser);
        return $this->stmt->execute((array) $p);
     }
}
