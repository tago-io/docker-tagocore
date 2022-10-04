# TagoCore

[![dockeri.co](https://dockeri.co/image/tagoio/tagocore)](https://hub.docker.com/r/tagoio/tagocore)

The official TagoCore docker image.

## Table of Contents

- [What is TagoCore?](#what-is-tagocore)
- [How to use this image](#how-to-use-this-image)
  - [Create a `Dockerfile` in your TagoCore project](#create-a-dockerfile-in-your-tagocore-project)
  - [Run a simple TagoCore script](#run-a-simple-tagocore-test)
- [Image Variants](#image-variants)
  - [`tagoio/tagocore:<version>`](#tagoio/tagocoreversion)
  - [`tagoio/tagocore:alpine`](#tagoio/tagocorealpine)
  - [`tagoio/tagocore:bullseye`](#tagoio/tagocorebullseye)
- [License](#license)

## What is TagoCore?

TagoCore is a free, fast, and open-source IoT platform for edge computing built using Node.js. The image is about 150 MB in size and supports multiple platforms and architectures.

See: https://tagocore.com

## How to use this image

### Create a `Dockerfile` in your TagoCore project

```dockerfile
# specify the base image with your desired version tagoio/tagocore:<version>
FROM tagoio/tagocore:0.7
```

You can then build and run the Docker image:

```console
$ docker build -t my-tagocore-app .
$ docker run -p 8888:8888 -p 8999:8999 -it --rm --name my-app my-tagocore-app
```

### Run a simple TagoCore test

For many simple tests, you may find it inconvenient to write a
complete `Dockerfile`. In such cases, you can run TagoCore by using the Docker image directly:

```console
$ docker run -p 8888:8888 -p 8999:8999 -it --rm --name my-test tagoio/tagocore start --no-daemon
```

## Image Variants

The `tagocore` images come in many flavors, each designed for a specific use case.

### `tagoio/tagocore:<version>`

This is the main image. If you are unsure about what your needs are, you
probably want to use this one.

### `tagoio/tagocore:alpine`

This image is based on the popular
[Alpine Linux project](http://alpinelinux.org), available in
[the `alpine` official image](https://hub.docker.com/_/alpine). Alpine Linux is
much smaller than most distribution base images (~5MB), and thus leads to much
slimmer images in general.

This variant is highly recommended when final image size being as small as
possible is desired. The main caveat to note is that it does use
[musl libc](http://www.musl-libc.org) instead of
[glibc and friends](http://www.etalabs.net/compare_libcs.html).

### `tagoio/tagocore:bullseye`

This image is based on version 11 of
[Debian](http://debian.org), available in
[the `debian` official image](https://hub.docker.com/_/debian).

## License

View [license information](https://tagocore.com/license) for the software contained in this image.