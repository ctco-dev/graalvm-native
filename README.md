# About
This is an example of dockerized GraalVM native image build.
Produced image is inherited from scratch, thus a few MB in size.

Project includes a Spark server with of couple of web resources:
1) GET /exception - logs an exception
2) GET /ping - returns "hi" message
3) GET /person/1 - returns a simple dto
4) POST /person - logs provided dto

Example:
```
curl --header --request POST --data {"name":"Joe"} http://localhost:8080/person
```

# How to Run
If you are on windows, execute:
```
run.cmd
```
Docker image/container names: graalvm-native

# Notes
Image size is under 20Mb.
## Memory
```
docker stats
```
MEM USAGE/LIMIT: 1.605MiB / 4MiB 

# Links
## GraalVM
* https://www.graalvm.org/docs/why-graal/

## Ahead-of-Time Compilation
* http://openjdk.java.net/jeps/295
* https://stackoverflow.com/questions/46579565/is-ahead-of-time-compilation-available-in-java-9
## Substrate VM
* https://github.com/oracle/graal/blob/master/substratevm/README.md
## Limitations
* https://github.com/oracle/graal/blob/master/substratevm/LIMITATIONS.md
* https://github.com/oracle/graal/blob/master/substratevm/REFLECTION.md
## Benchmarks
* https://medium.com/graalvm/instant-netty-startup-using-graalvm-native-image-generation-ed6f14ff7692

## Gradle Palantir GraalVM Plugin
* https://github.com/palantir/gradle-graal
 
## Alternative Examples
* https://zeringue.io/post/graalvm-gradle-docker/
* https://guides.micronaut.io/micronaut-creating-first-graal-app/guide/index.html