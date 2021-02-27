# figlet-docker

A very small (less than 3MB!) Docker image for FIGlet

## Features
- Very small, final image is less than 3MB, only contains files needed for FIGlet to work(FIGlet + standard fonts).
- FIGlet 2.2.5(the latest version of FIGlet), compiled from source
- Should run anywhere Docker can.

## Building

Simply clone this repo and run
``docker build -t figlet .``

Or, you can use the prebuilt version that is updated on every push to this repo: ``docker pull docker.pkg.github.com/okyanusoz/figlet-docker/figlet:main``.

**NOTE**: You need to login to GitHub Packages Registry to be able to pull the prebuilt version. Simply create a token that has the read:packages scope or use an existing one, then login using ``docker login docker.pkg.github.com`` with your username and your token as the password.

## Running FIGlet

To run FIGlet, type:
````
docker run -it --rm figlet <arguments>
````


## Note

The built Docker image contains the FIGlet binary in it, thus the built Docker image has FIGlet's license. See LICENSE.figlet
