docker stop graalvm-native
docker container rm graalvm-native
docker build -t graalvm-native .
docker run -p 8080:8080 -m 4m --name graalvm-native graalvm-native