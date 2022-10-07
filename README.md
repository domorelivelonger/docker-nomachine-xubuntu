
# docker-ubuntu-xubuntu-desktop-nomachine 7.10
Ubuntu Desktop 22.04 (XFCE4) Dockerfile with NoMachine 7.10 remote access

There are three tags available:

#### latest
22.04 ubuntu with firefox, chrome and chromium-browser and basic linux tools



# How to run
## Build

```
git clone https://github.com/domorelivelonger/docker-nomachine-xubuntu.git
cd docker-nomachine-xubuntu
docker build -t=domorelivelonger/docker-nomachine-xubuntu .
```
## Docker pull command
```
docker pull domorelivelonger/docker-nomachine-xubuntu
```

## Enviroment vaiables
USER -> user for the nomachine login

PASSWORD -> password for the nomachine login

## Usage

```
docker run --rm -d -p 4000:4000 --name nomachine -e PASSWORD=password -e USER=user --cap-add=SYS_PTRACE --shm-size=4g domorelivelonger/docker-nomachine-xubuntu
```

## Connect to the container

Download the NoMachine client from: https://www.nomachine.com/download, install the client, create a new connection to your public ip, port 4000, NX protocol, use enviroment user and password for authentication (make sure to setup enviroment variables for that)

## Timezone issue
Docker always uses UTC 0. 

To avoid it, you can use the following in Ubuntu:
```
docker run -d -p 4000:4000 --name desktop \
-e PASSWORD=password -v /etc/localtime:/etc/localtime:ro \
-e USER=user --cap-add=SYS_PTRACE --shm-size=4g domorelivelonger/docker-nomachine-xubuntu
```




### Docker and Docker-compose installation
```

sudo curl -L "https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose &&
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose &&
docker-compose --version
&&
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

Run docker and docker-compose from non-root user.
```
usermod -aG docker webxdata                  # to add myself to docker group
chgrp docker /usr/local/bin/docker-compose     # to give docker-compose to docker group,
chmod 750 /usr/local/bin/docker-compose   # to allow docker group users to execute it
```

