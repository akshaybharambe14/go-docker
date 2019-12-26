# Go + Docker = Awesomeness

## Follow bellow steps to get started

1. Have a look at [some important links](/docs/README.md)

2. Clone this repository -

   ```bash
   git clone https://github.com/akshaybharambe14/go-docker.git
   ```

3. [Install docker](https://docs.docker.com/install/)

4. Build, deploy and run a docker image -

   To containerize our app, we need to build an "image". The "Dockerfile" instructs docker to build desired image. All the docker files can be found in "./docker" folder.

   Explanation to docker commands is written in docker file itself.

   Here, we are building 3 types of images

   - [Basic](#basic-docker-image) (size 814 MB)
   - [With docker volume](#image-with-docker-volume) (size 814 MB)
   - [Optimized multistage image with docker volume](#optimized-multistage-image-with-docker-volume) (_Size 12 MB_)

5. Publish your docker image to docker hub.

   - Create your account at [docker](https://hub.docker.com/)
   - Log in to your account in docker cli with

     ```bash
     docker login
     ```

   - Tag your image with format `<username>/<target-name>:<version>`

     ```bash
     docker tag go-docker akshaybharambe14/go-docker:v1.0.0
     ```

   - Push it to docker hub

     ```bash
       docker push akshaybharambe14/go-docker:v1.0.0
     ```

   Thats it. Now you have your own docker image.

- ## Basic Docker image

  - Build a docker image -
    This will build with default "Dockerfile" at the root of repo.

    ```bash
    docker build -t go-docker .
    ```

    In our case, we need to provide path to Dockerfile with following command.
    This builds a docker image with name `go-docker` with file `./docker/example.Dockerfile`

    ```bash
    docker build -t go-docker -f ./docker/example.Dockerfile .
    ```

  - List docker images -

    ```bash
    docker image ls
    ```

    You can see an image with name "go-docker" in the list.

  - Run the image in container -

    ```bash
    docker run -d -p 6060:8080 go-docker
    ```

    This will map 6060 port from host os to our app with port. We can access it with <http://localhost:6060/>

  - List running containers -

    ```bash
    docker container ls
    ```

  - Stop the container with id `fff93d13a484`

    ```bash
    docker container stop fff93d13a484
    ```

- ## Image with docker volume

  As we have a logger in our app, which logs to a file named `app.log`. This file is not visible to use. For this we need to redirect our logs to a location on host machine.

  - Build -

    ```bash
    docker build -t go-docker-volume -f ./docker/volume.Dockerfile .
    ```

  - Run -
    This will map `D:/logs` from your host machine to `/app/logs` on the container.
    You can see the logs at `D:/logs/app.log`. The log file name is provided in the Dockerfile.

    ```bash
    docker run -d -p 6060:8080 -v D:/logs:/app/logs go-docker-volume
    ```

- ## Optimized multistage image with docker volume

  - Build -

    ```bash
    docker build -t go-docker-optimized -f ./docker/multistage.Dockerfile .
    ```

  - Run -

    ```bash
    docker run -d -p 6060:8080 -v D:/logs:/app/logs go-docker-optimized
    ```
