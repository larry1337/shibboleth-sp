# Shibboleth Service-Provider made with Docker

The eLearning platform Ilias is used as a service in this context.


## Preconditions
For the host system, I recommend using a virtual machine with Debian Jessy. In addition you will need Docker and Docker Compose on your host system. 
Therefor you can use the [Docker Installation Guide](https://docs.docker.com/engine/installation/linux/debian/) and the [Compose Installation Guide](https://docs.docker.com/compose/install/).


## Getting Started
1. Clone the repository on your host system
2. Navigate into the directory
3. There you can build the docker-image with the command: 
```bash
docker-compose build 
```
Do not worry, it will take a few minutes :wink:.

4. If the image has been built successfully, the following script must be executed once:
```bash
./init.sh                  
```

5. Now you can start the docker container on the previously built image: 
```bash
docker-compose up
```

6. Afterwards navigate to the following address in your browser: domain/setup/setup.php

7. Log into Ilias with the master-password: homer

8. ... 
