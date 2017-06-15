# Dockerized Shibboleth Service-Provider

The eLearning platform Ilias is used as a service in this context.
The Dockerfile will create following things for you:
- Shibboleth Service-Provider
- Ilias Version 5.2
- MySQL database

## Preconditions
For the host system, I recommend using a virtual machine with Debian Jessy. In addition you will need **Docker**, **Docker Compose** and **Git** on your host system. 
Therefor you can use the [Docker Installation Guide](https://docs.docker.com/engine/installation/linux/debian/), the [Compose Installation Guide](https://docs.docker.com/compose/install/) and this [How To Install Git on Debian 8 Guide](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-debian-8).
<br><br>

## Getting Started
1. Clone the repository on your host system: `git clone https://github.com/larry1337/shibboleth-sp.git`
<br><br>
2. Navigate into the directory
<br><br>
3. There you can build the docker-image with the command: `docker-compose build`<br>
Do not worry, it will take a few minutes :wink:.
<br><br>
4. If the image has been built successfully, the following script must be executed once: `./init.sh`
<br><br>
5. Now you can start the docker container on the previously built image: `docker-compose up`
<br><br>
6. Afterwards navigate to the following address in your browser: **yourdomain/setup/setup.php** <br>
<sub>(Note: You have to trust the self-signed certificate)</sub>
<br><br>
7. Log into Ilias with the master-password: **homer**
<br><br>
8. You will see the Ilias setup page with the List of Clients. Now we need a new client. Therefore press the blue button "Create New Client" and follow the setup steps.

	- **Step 1 - Database selection:** 
	Should be: MySQL 5.5x or higher (InnoDB engine)

	- **Step 2 - Basic Data:** 
	Client ID: ilias
	Database Host: mysql-db
	Database Password: root

	- **Step 3 - Database:**
	Activate the Create Database checkbox

	- **Step 4 - Languages:**
	Choose your desired language

	- **Step 5 - Contact Information:**
	Fill up the required fields

	- **Step 6 - Proxy:**
	If you have a proxy, you can do it here

	- **Step 7 - Registration:**
 	Skip the registration

	- **Step 8 - Finish Setup:** 
	You're done :sunglasses:

