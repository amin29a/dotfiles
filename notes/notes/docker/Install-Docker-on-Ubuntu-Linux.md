# Full article at

<https://www.makeuseof.com/install-docker-ubuntu/>


Before anything, check for existing version
```console
$ docker -v
```
-----------------------------------------------------------------------------------------
## Setting Up the Docker Software Repository

As good practice, first update your list of available software packages.
```console
$ sudo apt update
```


Then, download all the required dependencies for the installation using apt install.
```console
$ sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release
```


To add the official Docker GPG key to your local keyrings use the following command.
```console
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

Run the following command to use the stable repository release version of Docker.
```console
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
-----------------------------------------------------------------------------------------
## Installing the Docker Engine

Make sure to update your package sources using the command below, because you have 
recently 
added the Docker repository to your list of software sources.
```console
$ sudo apt update
```


To install the Docker Engine, run the following command. The command will by default 
install the latest stable version of Docker Engine.
```console
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

-----------------------------------------------------------------------------------------
## Confirming the installation
```console
$ docker -v
```

You can try to run the hello-world Docker image to test the installation. Since the 
image is not available locally on your computer, the system will download it from the 
Docker Hub, a library of container images. 
The next time you run the image again it will use the local copy that is on your PC.
```console
$ sudo docker run hello-world
```
Run again!
```console
$ sudo docker run hello-world
```

-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

If you wish to install some specific version of Docker, you can first check the list of 
available versions using the command below.
```console
$ apt-cache madison docker-ce
```

You can then install the specific version of Docker using the following command. For 
example, to install 5:20.10.6~3-0~ubuntu-focal:
```console
$ sudo apt-get install docker-ce=5:20.10.6~3-0~ubuntu-focal docker-ce-cli=5:20.10.6~3-0~ubuntu-focal containerd.io
``` 
