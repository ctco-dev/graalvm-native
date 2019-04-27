FROM oracle/graalvm-ce:1.0.0-rc15 as builder

WORKDIR home

# Get gradle distribution
COPY gradlew *.gradle /home/
COPY gradle gradle
# Get dependencies
RUN ./gradlew build || return 0

COPY . .

RUN ./gradlew assemble --info
RUN native-image --no-server --static -cp build/libs/native-*.jar \
    -H:ReflectionConfigurationFiles=reflection-config.json \
    -H:Name=native \
    Main

FROM scratch
WORKDIR /root/
COPY --from=builder /home/native .
CMD ["./native"]

