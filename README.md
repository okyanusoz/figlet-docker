# figlet-docker

A very small (less than 3MB!) Docker image for FIGlet

## Features
- Very small, final image is less than 3MB, only contains files needed for FIGlet to work(FIGlet + standard fonts).
- FIGlet 2.2.5(the latest version of FIGlet), compiled from source
- Should run anywhere Docker can.

## Building

Simply clone this repo and run
``docker build -t figlet .``

## Running FIGlet

To run FIGlet, type:
````
docker run -it --rm figlet <arguments>
````


## Note

The built Docker image contains the FIGlet binary in it, thus the built Docker image has FIGlet's license. See LICENSE.figlet
