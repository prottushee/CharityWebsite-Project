<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

include("login.php"); 
if($_SESSION['name']==''){
    header("location: signin.php");
}

$emailid = $_SESSION['email'];
$connection = mysqli_connect("localhost", "root", "");
$db = mysqli_select_db($connection, 'demo');

if (isset($_POST['submit'])) {
    $category = 'Taka'; // Default and only option
    $quantity = mysqli_real_escape_string($connection, $_POST['quantity']);
    $phoneno = mysqli_real_escape_string($connection, $_POST['phoneno']);
    $district = mysqli_real_escape_string($connection, $_POST['district']);
    $address = mysqli_real_escape_string($connection, $_POST['address']);
    $name = mysqli_real_escape_string($connection, $_POST['name']);

    $query = "INSERT INTO storm_donate(email, category, phoneno, location, address, name, quantity) VALUES ('$emailid', '$category', '$phoneno', '$district', '$address', '$name', '$quantity')";

    $query_run = mysqli_query($connection, $query);

    require 'PHPMailer/Exception.php';
    require 'PHPMailer/PHPMailer.php';
    require 'PHPMailer/SMTP.php';
    $mail = new PHPMailer(true);

    try {
        //Server settings
        $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
        $mail->isSMTP();                                            //Send using SMTP
        $mail->Host       = 'smtp.gmail.com';                       //Set the SMTP server to send through
        $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
        $mail->Username   = 'obito.uchiha1184@gmail.com';           //SMTP username
        $mail->Password   = '';                  //SMTP password
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
        $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

        //Sender
        $mail->setFrom('obito.uchiha1184@gmail.com', 'webProject');
        //Receiver
        $mail->addAddress($emailid, $name);

        //Content
        $mail->isHTML(true);                                  //Set email format to HTML
        $mail->Subject = 'Thank You for Your Donation';
        $mail->Body    = "
            <p>Dear $name,</p>
            <p>Thank you for your generous donation. Here are the details of your donation:</p>
            <p><b>Category:</b> $category</p>
            <p><b>Amount:</b> $quantity</p>
            <p><b>Phone Number:</b> $phoneno</p>
            <p><b>District:</b> $district</p>
            <p><b>Address:</b> $address</p>
            <p>We truly appreciate your support!</p>
            <p>Best regards,</p>
            <p>webProject</p>
        ";

        $mail->send();
        echo 'Message has been sent';
    } catch (Exception $e) {
        echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }

    echo '<script type="text/javascript">alert("Data saved and email sent")</script>';
    header("location:generatepdfforstorm.php");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donation</title>
    <link rel="stylesheet" href="loginstyle.css">
    <script>
        function validatePhoneNumber() {
            const phoneField = document.getElementById('phoneno');
            const phoneError = document.getElementById('phoneError');
            const phoneRegex = /^01\d{9}$/;

            if (!phoneRegex.test(phoneField.value)) {
                phoneError.style.display = 'block';
                phoneError.innerText = 'Phone number must be 11 digits starting with 01';
                return false;
            } else {
                phoneError.style.display = 'none';
                return true;
            }
        }

        document.addEventListener('DOMContentLoaded', (event) => {
            document.getElementById('phoneno').addEventListener('input', validatePhoneNumber);
        });
    </script>
</head>
<body style="background-color: #06C167;">
    <div class="container">
        <div class="regformf">
            <form action="" method="post" onsubmit="return validatePhoneNumber()">
                <p class="logo"><b style="color: #06C167;">দান</b></p>
                <div class="input">
                    <label for="category">Currency: Taka</label>
                    <input type="hidden" id="category" name="category" value="Taka">
                </div>
                <div class="input">
                    <label for="quantity">Amount:</label>
                    <input type="number" id="quantity" name="quantity" required/>
                </div>
                <b><p style="text-align: center;">Contact Details</p></b>
                <div class="input">
                    <div>
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" value="<?php echo $_SESSION['name']; ?>" required/>
                    </div>
                    <div>
                        <label for="phoneno">Phone No:</label>
                        <input type="text" id="phoneno" name="phoneno" maxlength="13" required/>
                        <span id="phoneError" style="color: red; display: none;"></span>
                    </div>
                </div>
                <div class="input">
                    <label for="location"></label>
                    <label for="district">District:</label>
                    <select id="district" name="district" style="padding:10px;">
                      <option value="dhaka">Dhaka</option>
                      <option value="chittagong">Chittagong</option>
                      <option value="sylhet">Sylhet</option>
                      <option value="rajshahi">Rajshahi</option>
                      <option value="khulna">Khulna</option>
                      <option value="barisal">Barisal</option>
                      <option value="rangpur">Rangpur</option>
                      <option value="mymensingh">Mymensingh</option>
                      <option value="comilla">Comilla</option>
                      <option value="narayanganj">Narayanganj</option>
                      <option value="gazipur">Gazipur</option>
                      <option value="savar">Savar</option>
                      <option value="tangail">Tangail</option>
                      <option value="kishoreganj">Kishoreganj</option>
                      <option value="manikganj">Manikganj</option>
                      <option value="munshiganj">Munshiganj</option>
                      <option value="faridpur">Faridpur</option>
                      <option value="pabna">Pabna</option>
                      <option value="bogra">Bogra</option>
                      <option value="rajbari">Rajbari</option>
                      <option value="natore">Natore</option>
                      <option value="naogaon">Naogaon</option>
                      <option value="joypurhat">Joypurhat</option>
                      <option value="sirajganj">Sirajganj</option>
                      <option value="dinajpur">Dinajpur</option>
                      <option value="kurigram">Kurigram</option>
                      <option value="lalmonirhat">Lalmonirhat</option>
                      <option value="nilphamari">Nilphamari</option>
                    </select>
                    <br><br>
                    <label for="address" style="padding-left: 10px;">Address:</label>
                    <input type="text" id="address" name="address" required/><br>
                </div>
                <div class="btn">
                    <button type="submit" name="submit">Submit</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
