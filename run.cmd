docker container rm native
docker build -t native . && docker run --name native native