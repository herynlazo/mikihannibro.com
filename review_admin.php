

<?php
include "config.php";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Admin</title>
    <style type="text/css">
        tr {
            font-size: 1.2em;
        }

        tr:hover {
            background-color: black;
            color: white;
        }

        th {
            color: #FF4500;
            font-size: 1.3em;
        }

        .del {
            color: red;
            text-decoration: none;
        }

        .del:hover {
            color: blue;
            text-decoration: none;
            text-shadow: 2px 3px 2px #FFFFFF;
        }
        .back-btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 400;
            text-align: center;
            text-decoration: none;
            background-color: #FF4500; 
            color: #ffffff;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .back-btn:hover {
            background-color: black; 
        }
    </style>
</head>

<body>

<?php
   if(isset($message)){
      foreach($message as $message){
         echo '
         <div class="message">
            <span>'.$message.'</span>
            <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
         </div>
         ';
      }
   }
?>

<div class="content">

<a href="admin_page.php" class="back-btn">Back</a> 

    <table border="1" width="100%" cellspacing="3" cellpadding="5" style="box-shadow: 5px 4px 10px 2px;">

        <tr>
            <th>ID</th><th>NAME</th><th>REVIEW</th><th>COMMENTS</th><th>REMOVE</th>
        </tr>

        <?php
        $limit = 50; // Adjust the limit as needed
        $page = isset($_GET['page']) ? $_GET['page'] : 1;
        $offset = ($page - 1) * $limit;

        try {
            $stmt = $conn->prepare("SELECT * FROM review LIMIT :limit OFFSET :offset");
            $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
            $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($result as $r) {
                ?>
                <tr align="center">
                    <td><?php echo $r['id']; ?></td>
                    <td><?php echo $r['name']; ?></td>
                    <td><?php echo $r['review']; ?></td>
                    <td><?php echo $r['description']; ?></td>
                    <td><a href="delreview.php?a=<?php echo $r['id']; ?>" class="del">DELETE</a></td>
                </tr>
                <?php
            }
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
        ?>
    </table>

    <!-- Display pagination links -->
    <?php
    try {
        $stmt = $conn->prepare("SELECT * FROM review");
        $stmt->execute();
        $totalRows = $stmt->rowCount();
        $totalPages = ceil($totalRows / $limit);

        for ($i = 1; $i <= $totalPages; $i++) {
            echo '<a href="?page=' . $i . '">' . $i . '</a> ';
        }
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
    ?>
</div>

</body>

</html>
