<?php
session_start();
include "header.php";
include "config.php";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mikihan ni Bro</title>

    <style type="text/css">
        .feedback {
            height: 200px;
        }

        .contact-box {
            padding: 70px 0px;
            text-align: center;
        }

        .heading-title p {
            font-size: 35px;
            color: orangered;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            width: 500px;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #FF4500;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .custom-select {
            width: 500px;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #FF4500;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-control:focus {
            border-color: black;
        }

        .form-group textarea {
            resize: none;
        }

        .submit-button {
            margin-top: 15px;
        }

        .btn-common {
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
			width:500px;
        }

        .btn-common:hover {
            background-color: black;
        }

        #msgSubmit {
            margin-top: 15px;
			color: #FF4500;
			font-weight:bold;
			font-size:20px;
        }

        .footer {
            text-align: center;
        }

        .box-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 20px;
            margin-top: 20px;
        }

        .box {
            width: 200px;
            padding: 10px;
            background-color: #f1f1f1;
            margin: 10px;
            border-radius: 5px;
        }

        .box i {
            font-size: 24px;
            margin-bottom: 10px;
            color: #2ecc71;
        }

        .credit {
            margin-top: 20px;
        }

      
    </style>
</head>

<body>
     
<script>
    document.addEventListener('DOMContentLoaded', function () {
        <?php
        if (isset($_SESSION['review_added']) && $_SESSION['review_added']) {
            echo 'document.getElementById("msgSubmit").innerHTML = "Review Successfully Added";';
            unset($_SESSION['review_added']); // Clear the session variable
        }
        ?>
        setTimeout(function () {
            document.getElementById("msgSubmit").innerHTML = ""; // Clear the message after 5 seconds (adjust as needed)
        }, 5000);
    });
  </script>

  <div id="msgSubmit" class="h3 text-center"></div>

    <center> <img src="images/feedback.jpg" style="background-color: red" class="feedback"> </center>

    <div class="contact-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="heading-title text-center">
                        <p>Our Main Goal is Client Satisfaction</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <form action="" method="post">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Your Name" required data-error="Please enter your name">
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <select class="custom-select d-block form-control" id="guest" name="rev" required data-error="Please Select Person">
                                        <option value="Excellent">Excellent</option>
                                        <option value="Good">Good</option>
                                        <option value="Poor">Poor</option>
                                        <option value="Very Poor">Very Poor</option>
                                    </select>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <textarea class="form-control" id="message" placeholder="Your Message" rows="4" name="desc" data-error="Write your message" required></textarea>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="submit-button text-center">
                                    <button name="sb" class="btn btn-common" id="submit" type="submit">Send Message</button>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <?php
                    if (isset($_POST['sb'])) {
                        $nm = $_POST['name'];
                        $rev = $_POST['rev'];
                        $des = $_POST['desc'];

                        try {
                            $stmt = $conn->prepare("INSERT INTO review (name, review, description) VALUES (?, ?, ?)");
                            $stmt->bindParam(1, $nm);
                            $stmt->bindParam(2, $rev);
                            $stmt->bindParam(3, $des);
                            $stmt->execute();

                            $_SESSION['review_added'] = true;
                        } catch (PDOException $e) {
                            echo "Error: " . $e->getMessage();
                        }
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>

	

</body>
</html>
