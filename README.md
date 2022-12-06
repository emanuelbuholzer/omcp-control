# omcp-control

omcp-control is a robot control runtime for motion control photography.
It's goal is to simplify and standardize the integration of robots when doing motion control photography using omcp.
omcp-control is based on [ros2](https://docs.ros.org/en/humble/index.html) and [ros2_control](https://github.com/ros-controls/ros2_control).

## Building images

In order to build and develop with omcp-control you'll need [Podman](https://podman.io/getting-started/installation) and optionally Make.

omcp-control consists of the following images:
- **omcp-control-base**: This image includes [ros2](https://docs.ros.org/en/humble/index.html), which should change the least.
- **omcp-control-dev**: This images includes build tools such as [colcon](https://colcon.readthedocs.io/en/released/) and utility tools such as [rviz](http://wiki.ros.org/rviz) to develop and troubleshoot packages.
- **omcp-control-runtime**: This image includes the built packages and the production runtime.

To get started, build first the base image (or see the Makefile using) `make base`.
Once this is done you have a container image for omcp for both amd64 and arm64.

To run and play around with your base image, run:
```bash
podman run -it --rm omcp-control-base

source /opt/ros/humble/setup.sh
ros2 --help
```

### Building multi-arch images

In order to build multi-architecture images use podman machine with qemu and binfmt_misc.
To set this up run the following commands:
```sh
podman machine ssh

# inside podman machine
sudo rpm-ostree install qemu-user-static
sudo systemctl reboot
```

### Troubleshooting

During builds on MacOS or on Windows the following error could occur:

> E: Release file for https://.../InRelease is not valid yet (invalid for another Xh Xmin XXs). Updates for this repository will not be applied.


This happens when the clock of your podman machine is out of sync.
To fix this connect to your machine and update its clock:
```sh
podman machine ssh

# inside podman machine
sudo hwclock --hctosys
```
