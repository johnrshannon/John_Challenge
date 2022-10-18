**SRE Challenge**

Infrastructure

For this project, please think about how you would architect a scalable and secure static web application in AWS.
• Create and deploy a running instance of a web server using a configuration management tool of your choice. The web server should serve one page with the following content.
 
<html>
<head>
<title>Hello World</title> </head>
<body>
<h1>Hello World!</h1> </body>
</html>
• Secure this application and host such that only appropriate ports are publicly exposed and any http requests are redirected to https. This should be automated using a configuration management tool of your choice and you should feel free to use a self-signed certificate for the web server.
• Develop and apply automated tests to validate the correctness of the server configuration.
• Express everything in code.
• Provide your code in a Git repository named <FIRSTNAME>_Challenge on GitHub.com Be prepared to walk though your code, discuss your thought process, and talk through how you might monitor and scale this application. You should also be able to demo a running instance of the host.

---


**Automated AWS Deployment of Web App**

My approach to this problem started with AWS Amplify. I was pleasantly surprised to discover this service, which offers just about everything asked for in the assessment- from an auto-assigned certificate and http->https redirect, to easy integration with Route53 for DNS record assignment, and implicit access to autoscaling and monitoring with CloudWatch. It even walks the user through the construction of a synthetic canary to monitor reliability. You can seed it with any Github repo, and it'll use it to spark its CICD pipeline. You can find that solution at (amplify.johnrshannon.net). 

For my actual, non-turnkey solution I chose Nginx as my web server. It's serving my index.html page, it's redirecting traffic from 80 to 443, and it's integrating my certificate for handling https. 

Rather than Terraform and Ansible, I went with AWS CloudFormation for provisioning and Docker in place of a conventional CMT. The HelloWorldWebApp.yaml in ./ describes the AWS resources allocated, and the Dockerfile informs how the image will be configured for web serving. 

I used Github Actions as my CI/CD model. The .yaml in .github/workflows/ holds most of the logic of the project- from credentialing in AWS, to creating a new CFN stack with the template, to credentialing for Docker Hub, to staging everything for the Nginx configuration, to building and pushing the Docker image, to SSH'ing into the EC2 instance and running the needed Docker commands, up to running the correctness tests. This workflow is triggered by a Git push. 

This form of the project is accessed at (www.johnrshannon.net). I have plenty of thoughts about scalability and monitoring, should the conversation go further. 

Also re: the credit card solution: this monstrosity isn't really deplyable (or legal (or morally defensible)), as I ran out of time. Just quickly showing I can parse and throw together the needed regex. 
