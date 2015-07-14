# docker-b2g-config

Use Docker to run the Boot2Gecko config script using Python 2.x.

Note that this container is only intended to run the `./config.sh` script - you will need to run the `./build.sh` script using a *different container*. [`simonjohansson/B2G-build`](https://github.com/simonjohansson/B2G-build) is a good place to start.

# Set up

1. Clone this repository:

        git clone --recursive https://github.com/mparker17/docker-b2g-config.git
        cd docker-b2g-config/

2. Build an image:

        docker build -t b2g-config .

# Use

1. Clone Boot2Gecko:

        git clone --recursive https://github.com/mozilla-b2g/B2G.git
        cd B2G/

2. Run the Boot2Gecko configuration script.
    This is equivalent to running `./config.sh $device_name`.
    Replace `$device_name` with the device name you want to build for.

        docker run --rm -ti -v $PWD:/B2G -w /B2G b2g-config $device_name

    You can leave out `$device_name` to build the emulator:

        docker run --rm -ti -v $PWD:/B2G -w /B2G b2g-config

Once the configuration script has finished successfully, you will need to run the `./build.sh` script using a *different container*. [`simonjohansson/B2G-build`](https://github.com/simonjohansson/B2G-build) is a good place to start.

# Debugging

If you run into problems, you can run a shell in the container with:

        docker run --rm -ti -v $PWD:/B2G -w /B2G --entrypoint /bin/bash

To run a root shell, add `-u root`:

        docker run --rm -ti -v $PWD:/B2G -w /B2G -u root --entrypoint /bin/bash

For more information, see [the Docker run reference](https://docs.docker.com/reference/run/).
