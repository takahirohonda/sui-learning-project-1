# 1. Using commands

```bash
docker run --platform linux/amd64 --name hellosui -itd -e DOCKER_TLS_VERIFY=0 -v $(pwd):/sui mysten/sui-tools:devnet
docker exec -it hellosui bash
```

# 2. Using Dockerfile

```bash
docker build -t custom-sui-tools .
docker run --platform linux/amd64 --name hellosui -itd \
  -v $(pwd):/sui custom-sui-tools
```

Note that the -v $(pwd):/sui option in the docker run command still needs to be provided to map your local directory ($(pwd)) to the /sui folder inside the container. Dockerfiles cannot directly define host-to-container volume mappings.
