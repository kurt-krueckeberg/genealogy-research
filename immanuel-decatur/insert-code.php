<?php
declare(strict_types=1);

$dsn = 'mysql:dbname=imman;host=localhost;port=3306';

$options = [
  PDO::ATTR_EMULATE_PREPARES   => false, // Disable emulation mode for "real" prepared statements
  PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Disable errors in the form of exceptions
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Make the default fetch be an associative array
];

class pdoInserer {

   public function __construct(\PDP $pdo, string $sql) {}
  
}

function insert(\PDOStatement $s)
{

}

try {

 $pdo = new \PDO($dsn, "kurt", "kk0457", $options);


 $sql = "INSERT INTO person (fname, lname, sex, fid, mid, bdate, bdorf, bkreis, bland, founder) VALUES (:fname, :lname, :sex, :fid, :mid, :bdate, :bdorf, :bkreis, :bland, :founder)";
 // $sql = "INSERT INTO person (fname, lname, sex, fid, mid, bdate, bdorf, bkreis, bland, founder) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

 //Prepare the statement.
 $stmt = $pdo->prepare($sql);

/*
 Read and parse file and build this array:
 
 $input = [
 'fname' => 'first',
 'lname' =>  'last',
 'sex' =>  'm',
 'fid' =>  $fid,
 'mid' =>  $mid,
 'bdate' =>  ' ',
 'bdorf' =>  ' ',
 'bkreis' =>  ' ',
 'bland' =>  ' ',
 'founder' => true,
 ];

*/

 $rc = $stmt->execute($input);

 $id = $pdo->lastInsertId();
 // Get last inserted id!
/*
 * Insert all the persons listed in the biographies.
 * Then insert ceremonies, families and children.
 */
echo "Insertion of Person::unknown(). \$rc  = $rc \n";

} 
catch (Exception $e) {
  error_log($e->getMessage());
  exit('Something bad happened'); 
}
