<?php

$conn = new mysqli("localhost","root","","db_vote1");

$q = $conn->query("SELECT nipd FROM m_user WHERE password='1'");

while($r = $q->fetch_assoc()){

    $hash = password_hash($r['nipd'], PASSWORD_DEFAULT);

    $conn->query("
        UPDATE m_user 
        SET password='$hash' 
        WHERE nipd='".$r['nipd']."'
    ");
}

echo "SUCCESS";