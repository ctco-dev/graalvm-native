FROM oracle/graalvm-ce:1.0.0-rc15 as builder

WORKDIR src

COPY . .

RUN ./gradlew nativeImage --info

FROM scratch
WORKDIR /root/
COPY --from=builder /src/build/graal/native .
CMD ["./native"]

