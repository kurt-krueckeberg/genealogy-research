<?php
declare(strict_types=1);

include "Person.php";

$dsn = 'mysql:dbname=imman;host=localhost;port=3306';

$options = [
  PDO::ATTR_EMULATE_PREPARES   => false, // Disable emulation mode for "real" prepared statements
  PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Disable errors in the form of exceptions
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Make the default fetch be an associative array
];

try {

  $pdo = new \PDO($dsn, "kurt", "kk0457", $options);

  $uid = 1; 

  $p = new Person($pdo);

 /*
   Set the values of interest manually
   $p->fname =  
   ...
   $p->insert();

   ...OR...do it all at once.
   $p->insert("fridrich", "bleeke", unid, unid, ....)

   $id = $pdo->lastInsertId();
 */
 $p->insert("Fridrich", "Bleeke"); 
 
} 
catch (Exception $e) {
  error_log($e->getMessage());
  exit('Something bad happened'); 
}
