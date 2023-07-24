# Docker VSCode Remote Tunnel

This repository contains the necessary files to build and run a Docker container with Visual Studio Code installed and configured for remote development. The container is based on Ubuntu 22.04 and utilizes the official Visual Studio Code command-line interface (CLI) to enable remote development capabilities.

## Requirements

- Docker must be installed on the host machine to build and run the container.

## Getting Started

Follow these steps to build and run the Visual Studio Code remote development container:

1. Clone this repository to your local machine.

2. Navigate to the repository directory.

3. Create a copy of `.env.example` file with a `.env` file in the root directory with the following content:

   ```bash
   IMAGE_NAME=<your-image-name>
   CONTAINER_NAME=<your-container-name>
   MACHINE_NAME=<your-machine-name>
   ```

   Replace `<your-image-name>`, `<your-container-name>`, and `<your-machine-name>` with your desired names for the Docker image, container, and remote machine, respectively.

4. Build the Docker container using the provided script. The `run.sh` script will handle the build process and set the appropriate architecture for the Visual Studio Code CLI:

   ```bash
   sh run.sh
   ```

5. After a successful build, the container will be created. Depending on the specified `MACHINE_NAME`, the following command will run the container with the required environment variables:

   ```bash
   # If MACHINE_NAME is not specified, use the following command:
   docker run -it --name $CONTAINER_NAME $IMAGE_NAME

   # If MACHINE_NAME is specified, use the following command:
   docker run -it --name $CONTAINER_NAME -e MACHINE_NAME="$MACHINE_NAME" $IMAGE_NAME
   ```

   Replace `$CONTAINER_NAME` and `$IMAGE_NAME` with the corresponding values from the `.env` file.

6. The Visual Studio Code CLI is automatically launched inside the container using the provided `code tunnel` command. This enables remote development functionality.

## Additional Notes

- The `bin` directory contains scripts used during the container build process. These scripts are copied to `/usr/local/bin/` within the container.

- The Dockerfile installs essential dependencies and tools required for development, including timezone data, Gnome Keyring, wget, curl, Python 3, CA certificates, Git, and build-essential.

- The container's working directory is set to `/home/workspace`.

## License

This project is licensed under the [MIT License](LICENSE).

Please feel free to contribute to this project by creating pull requests or opening issues if you encounter any problems. Happy coding!
