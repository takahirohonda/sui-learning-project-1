# Use mysten/sui-tools:devnet as the base image
FROM mysten/sui-tools:devnet

# Set environment variable to disable TLS verification
ENV DOCKER_TLS_VERIFY=0

# Set the working directory inside the container
WORKDIR /sui