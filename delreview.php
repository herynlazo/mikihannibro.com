<?php
include "config.php";

if (isset($_GET['a']) && is_numeric($_GET['a'])) {
    $reviewId = $_GET['a'];

    try {
        // Prepare and execute a DELETE statement
        $stmt = $conn->prepare("DELETE FROM review WHERE id = :reviewId");
        $stmt->bindParam(':reviewId', $reviewId, PDO::PARAM_INT);
        $stmt->execute();

        // Redirect back to review_admin.php after deletion
        header("Location: review_admin.php");
        exit();
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
} else {
    // Invalid or missing review ID, handle accordingly
    echo "Invalid review ID";
}
?>
