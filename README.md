# Dockerized Shibboleth Service-Provider

## Included
- Apache as Webserver 
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
4. If the image has been built successfully, the following script must be executed once: `./init.sh`<br>
It is ok if some directories were not found.
<br><br>
5. Now you can start the docker container on the previously built image: `docker-compose up`
<br><br>
6. Afterwards navigate to the following address in your browser: **yourdomain/setup/setup.php** <br>
<sub>(Note: You have to trust the self-signed certificate)</sub>
<br><br>
7. Log into Ilias with the master-password: "homer"
<br><br>
8. You will see the Ilias setup page with the List of Clients. Now we need a new client. Therefore press the blue button "Create New Client" and follow the setup steps:
	- **Step 1 - Database selection:** <br>
	MySQL 5.5x or higher (InnoDB engine)<br>

	- **Step 2 - Basic Data:** <br>
	Client ID: "ilias"<br>
	Database Host: "mysql-db"<br>
	Database Password: "root"<br>

	- **Step 3 - Database:**<br>
	Activate the "Create Database" checkbox<br>

	- **Step 4 - Languages:**<br>
	Choose your desired language<br>

	- **Step 5 - Contact Information:**<br>
	Fill up the required fields<br>

	- **Step 6 - Proxy:**<br>
	If you have a proxy, you can setup the Proxy configuration here.<br>

	- **Step 7 - Registration:**<br>
 	Skip the registration<br>

	- **Step 8 - Finish Setup:**<br> 
	You're done! :sunglasses:<br>
<br>
9. Log into Ilias with the root account, password: "homer". Make sure to change the password after installation.
<br><br>
10. Navigate to *Administration* > *Authentication and Registration* and activate Shibboleth as default authentication mode. Save it.
<br><br>
11. Now go to the Shibboleth tab and make the following settings:

- Enable Shibboleth support<br>
	
- Allow Local Authentication if you want to support the default Ilias login<br>
	
- Unique Shibboleth attribute: HTTP_SHIB_UID<br>
	
- Attribute for first name: HTTP_SHIB_FIRSTNAME<br>
	
- Attribute for lastname: HTTP_SHIB_LASTNAME<br>
	
- Attribute for e-mail address: HTTP_SHIB_EMAIL<br>
	
- Attribute for street: HTTP_SHIB_STREET<br>
