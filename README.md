# Go + Docker = Awesomeness

## Getting started

Have a look at [some important links](/docs/README.md)

- Some basic commands:

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

- Running a container with docker volume

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

- Running a container with docker volume and multistage build

  - Build -

    ```bash
    docker build -t go-docker-optimized -f ./docker/multistage.Dockerfile .
    ```

  - Run -

    ```bash
    docker run -d -p 6060:8080 -v D:/logs:/app/logs go-docker-optimized
    ```
