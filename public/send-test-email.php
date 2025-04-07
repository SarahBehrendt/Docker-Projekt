<?php
$to = "recipient@example.com";
$subject = "Test Mail";
$message = "Dies ist eine Test-Mail.";
$headers = "From: test@example.com";

if (mail($to, $subject, $message, $headers)) {
    echo "Mail wurde erfolgreich gesendet!";
} else {
    echo "Fehler beim Senden der Mail.";
}
?>