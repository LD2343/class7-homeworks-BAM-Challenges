#!/bin/bash
# This line above tells the system to use the bash shell to run this script
# The "#!" is called a "shebang" - it's like saying "use this program to run what follows"

#Found this here - https://stackoverflow.com/questions/64880302/is-it-possible-to-execute-the-modified-user-data-of-an-existing-ec2-once
#The cloud-init clean will execute user data script on each run
cloud-init clean

####################################################################
# This section installs the needed software and sets it up
####################################################################

# Install and configure a web server (Apache HTTP Server)
# The "dnf" command is Amazon Linux's package manager 

# Update all installed software to the latest versions
# The "-y" means "automatically say yes to any prompts"
dnf update -y

# Install Apache web server software (called "httpd" on Linux)
dnf install -y httpd

# Start the web server service (make it begin running)
systemctl start httpd

# Enable the web server to automatically start when the computer reboots
systemctl enable httpd

####################################################################
# Here you can change the picture and text if you want
####################################################################

# Set the image URL as a variable to make it easy to change later
# You can modify this URL to use any image you want on your webpage
IMAGE="https://www.w3schools.com/images/w3schools_green.jpg"
TEXT="My EC2 Instance"

####################################################################
# Here we get the metadata for the EC2 instance
####################################################################

# Get AWS metadata about this EC2 instance
# AWS provides a special internal web address that only works from inside EC2 instances
# This address (169.254.169.254) gives you information about the current instance

# Base URL and header variables for metadata service
BASE_URL="http://169.254.169.254/latest"
HEADERS="X-aws-ec2-metadata-token"

# Get a "session token" first 
# This token acts like a temporary password that expires after 1 hour (3600 seconds)
# The $(...) syntax captures the output of the command inside and stores it in the TOKEN variable
# curl is a command-line tool for using web protocols (like downloading things)
# -X PUT specifies the type of web request (we need PUT to generate the session token)
# -H adds a header to the request
TOKEN=$(curl -X PUT "$BASE_URL/api/token" -H "$HEADERS-ttl-seconds: 3600" -s)

# Get metadata directly into variables
# The "-s" flag makes curl run silently (without showing progress information)
LOCAL_IP=$(curl -H "$HEADERS: $TOKEN" -s "$BASE_URL/meta-data/local-ipv4")
AZ=$(curl -H "$HEADERS: $TOKEN" -s "$BASE_URL/meta-data/placement/availability-zone")
MAC_ID=$(curl -H "$HEADERS: $TOKEN" -s "$BASE_URL/meta-data/network/interfaces/macs/")

# Use the MAC address to get the VPC (Virtual Private Cloud) ID
# This requires the MAC address from the previous step
VPC_ID=$(curl -H "$HEADERS: $TOKEN" -s "$BASE_URL/meta-data/network/interfaces/macs/${MAC_ID}/vpc-id")

# Get instance name from tags
HOST_NAME=$(hostname -f)

####################################################################
# Here we create an HTML web page with the collected information
####################################################################

# Using a "heredoc" (here document) - a cleaner way to write multi-line text
# "cat << EOF" means "output everything until you see 'EOF' on its own line"
# This is easier to read than using echo with quotes, especially for HTML
cat << EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>EC2 Instance Info</title>

    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h1 { color: #232f3e; }
        p { margin: 10px 0; }
        img { max-width: 300px; margin: 20px 0; }
    </style>

</head>
<body>
	<h2>Linux Server 3</h2>

    <br><br>
    <img src="https://class7-hw1-capeverde.s3.us-east-1.amazonaws.com/picture4.jpg" width="400">
    <img src="https://class7-hw1-capeverde.s3.us-east-1.amazonaws.com/picture5.jpg" width="400">
    <img src="https://class7-hw1-capeverde.s3.us-east-1.amazonaws.com/picture6.jpg" width="400">
    <img src="https://class7-hw1-capeverde.s3.us-east-1.amazonaws.com/picture7.jpg" width="400">

    <h2>Instance Details</h2>
    <p><strong>Hostname:</strong> ${HOST_NAME}</p>
    <p><strong>Private IP:</strong> ${LOCAL_IP}</p>
    <p><strong>Availability Zone:</strong> ${AZ}</p>
</body>
</html>
EOF


# The "> /var/www/html/index.html" redirects all that text into a file
# /var/www/html/ is the default folder where Apache web server looks for web pages
# index.html is the default file name web browsers request when visiting a website

####################################################################
# Summary
####################################################################

# This script installs a web server, collects information about the EC2 instance
# it's running on, creates a web page displaying that information, and displays a picture. 
# When complete, you can visit this instance's public IP address or DNS address
# in a web browser to see the information page.
# Remember to use HTTP://<your public DNS> since TLS is not configured.