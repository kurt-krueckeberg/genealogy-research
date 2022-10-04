<?php
declare(strict_types=1);

$dsn = 'mysql:dbname=imman;host=localhost;port=3306';

$options = [
  PDO::ATTR_EMULATE_PREPARES   => false, // Disable emulation mode for "real" prepared statements
  PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Disable errors in the form of exceptions
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Make the default fetch be an associative array
];

try {

  $pdo = new \PDO($dsn, "kurt", "kk0457", $options);

  echo "pdo successfully created.\n";

$sql = "INSERT INTO person (fname, lname, sex, fid, mid, bdate, bdorf, bkreis, bland, founder) VALUES (:fname, :lname, :sex, :fid, :mid, :bdate, :bdorf, :bkreis, :bland, :founder)";

//Prepare the statement.
$stmt = $pdo->prepare($sql);

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

$rc = $stmt->execute($input);

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
