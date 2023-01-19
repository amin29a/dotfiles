<https://www.makeuseof.com/run-ubuntu-as-docker-container/>


#Step 1: Getting the Ubuntu Docker Image


You can download the latest image of Ubuntu using the following command:
```
$ sudo docker pull ubuntu
```

If you are interested in a specific version, simply look at the available tags of the 
image in 
Docker Hub and then download it using that specific tag. For example, to download 
Ubuntu 20.04, run:
```
$ sudo docker pull ubuntu:20.04
```


You can list all the Docker images on your PC using the:
```
$ sudo docker images
```

#Step 2: Running the Ubuntu Image


A Docker image is simply a blueprint of instructions for building a container. A 
container is a running instance of a Docker image. 
To bring the Ubuntu image you just downloaded to life, run the following command:
```
 $ sudo docker run -ti --rm ubuntu /bin/bash
```
This command tells Docker to run the container in a terminal interactive mode (-ti). 
The /bin/bash argument is a way of telling the container to run the Bash shell terminal. 
Finally, the --rm flag instructs Docker to automatically remove the container after we 
stop it.

The shell starts as a root user and the terminal is similar to what you get on a typical 
Linux system. 
By default, the container gets a random hostname.


#Saving the Docker Container State

When you stop the Docker container at this stage, you'll lose all the changes you made, 
including software updates and installed tools. 
That is how Docker containers are designed; they're easy to replace, stop, and manage.

As you might know by now, Docker is a versatile tool; it allows you to save the state of 
containers if you wish to. First, check the container ID using the following command:
```
$ sudo docker ps
```

Save the state of the container by running the following command:
``` 
$ docker commit -p container_id new_container_name
```

Remember to replace container_id in the following command with the correct one. Also, 
Docker image names can only be lowercase.
``` 
$ sudo docker commit -p 524aa76baafb myubuntu
``` 

The preceding command will pause the container before saving it and will create a new 
Docker image named myubuntu. 
The new Docker image will contain all changes that you've made to it. And with that, 
you've just created a custom Ubuntu Docker image.


If you list your Docker images using the `$ sudo docker images` command, your new custom 
image should be listed along.


#Persisting Data on the Ubuntu Docker Container

Another powerful feature of Docker is the ability to persist or share data with the host 
machine. 
There are two main options: using mounted volumes or Docker volumes. Docker advocates 
for the latter because it is better in comparison to mounted volumes.

You can create a Docker volume anywhere on your PC. Let's create it in the home 
directory and name it Docker_Share.
``` 
$ sudo mkdir -p Docker_Share
```

Next, stop the Ubuntu container using the following command, substituting container_id 
with the actual ID of the Docker container:
``` 
$ sudo docker stop container_id
``` 

Finally, we can run the Ubuntu image to persist data using the Docker_Share directory 
using the command below. Alternatively, you can create a docker-compose file to easily 
fire up your Docker images.
``` 
$ sudo docker run -ti --rm -v ~/Docker_Share:/data ubuntu /bin/bash
``` 

The command will start the Ubuntu image and create the /data directory within the Docker 
container. The /data directory is mapped to the Docker_Share folder you created earlier.

You can access any created or modified files on the /data directory of the container 
using the Docker_Share directory. The reverse is also true; 
Docker will replicate any file modifications in the Docker_Share directory in the /data 
directory of the container.
