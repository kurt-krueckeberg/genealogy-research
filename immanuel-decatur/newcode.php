<?php
declare(strict_types=1);

include "Person.php";

// https://mariadb.com/resources/blog/developer-quickstart-php-data-objects-and-mariadb/

$dsn = 'mysql:dbname=imman;host=localhost;port=3306';

$options = [
  PDO::ATTR_EMULATE_PREPARES   => false, // Disable emulation mode for "real" prepared statements
  PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Disable errors in the form of exceptions
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Make the default fetch be an associative array
];

try {

  $pdo = new PDO($dsn, "kurt", "kk0457", $options);

  echo "pdo successfully created.\n";

$sql = "INSERT INTO person (fname, lname, sex, fid, mid, bdate, bdorf, bkreis, bland, founder) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

//Prepare the statement.
$stmt = $pdo->prepare($sql);

$p = Person::unknown();

$rc = $stmt->execute(array(serialize($p)));

echo "Insertion of Person::unknown(). \$rc  = $rc \n";

} 
catch (Exception $e) {
  error_log($e->getMessage());
  exit('Something bad happened'); 
}

