<?php
declare(strict_types=1);

include "Person.php";

$dsn = 'mysql:dbname=imman;host=localhost;port=3306';

$options = [
  PDO::ATTR_EMULATE_PREPARES   => false, // Disable emulation mode for "real" prepared statements
  PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Disable errors in the form of exceptions
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Make the default fetch be an associative array
];

/*
 Alogithm:
 
 1. Insert new founders person's parents as unkown
 2. insert new founder person, new founder wife person, and new children persons, if any. 
 3. insert associated ceremonies for founder
 3. insert new family record for founder married couple 
 4. insert new children recores associated with this the family above.

*/
function insert_unknown(\PDO $pdo, string $fname, string $last) : int 
{

  $p = new Person($pdo, "Fridrich", "Bleeke"); 

 /*
   Set the values of interest manually
   $p->fname =  
   ...
   $p->insert();

   ...OR...do it all at once.
   $p->insert("fridrich", "bleeke", unid, unid, ....)

   $id = $pdo->lastInsertId();
 */
  
 $p->insert();

 $fid = $pdo->lastInsertId();

 return $fid;
}
class Inserter {

   public function __construct(private \PDO $pdo)

   public function __invoke(?? $founder) // array or stdClass or Person?
 
}

try {

  $pdo = new \PDO($dsn, "kurt", "kk0457", $options);

  $inserter = new Inserter($pdo);

  foreach ($founders as $founder) { // use SPl iteratos

       insert($founder);
  }
} 
catch (Exception $e) {
  error_log($e->getMessage());
  exit('Something bad happened'); 
}
