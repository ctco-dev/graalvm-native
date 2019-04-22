docker container rm graalvm-native
docker build -t graalvm-native . && docker run --name graalvm-native graalvm-native