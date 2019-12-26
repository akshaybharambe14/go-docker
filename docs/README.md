# Go + Docker = Awesomeness

- You might find this helpful:

  - [How Docker works](https://docs.docker.com/engine/docker-overview/)
  - [Docker terminology by Microsoft](https://docs.microsoft.com/en-us/dotnet/architecture/microservices/container-docker-introduction/docker-terminology)
  - [Docker introduction by RedHat](https://www.redhat.com/en/topics/containers/what-is-docker)
  - [Docker container](https://www.edureka.co/blog/what-is-docker-container)

- Docker -

  Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and ship it all out as one package (The docker image). It is different form of virtualization as an operating system is virtualized instead of hardware. By this docker uses same kernel as of host os and cost to start a container significantly decreases.

  This solves the famous problem "It works on my machine...", because "it runs in a container". The execution environment is always the same, on different machine or even on different infrastructure.

  Consider a scenario. You want to build and deploy an app. With virtual machine, you must setup execution environment. Its all good till now. Things change drastically when you want to build and deploy an app with different execution environment, on the same host machine. Solution, you must create another virtual machine. This is the case where docker shines. You can build, deploy and execute multiple apps, with different execution env. on same host machine.

- Why?

  - Setting up a container is fast and easy.
  - It saves time required to setup execution environment.
  - Eliminate environment inconsistencies and the "works on my machine" problem by packaging the application, configs and dependencies into an isolated container.
  - The built image is portable.

Docker Daemon -

Image -

Container -

Docker hub -

Volume -

Multistage build -
