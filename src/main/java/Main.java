import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;

import static spark.Spark.*;

@Slf4j
public class Main {

    public static void main(String[] args) {
        log.info("starting...");
        Gson gson = new Gson();

        //http://sparkjava.com/documentation

        port(8080);
        get("/ping", (request, response) -> "hi");

        get("/person/1", (request, response) -> new Person("Bob"), gson::toJson);
        post("/person", (request, response) -> {
                    Person p = gson.fromJson(request.body(), Person.class);
                    log.info("Got person: {}", p.toString());
                    return "ok";
                }
        );

        get("/exception", (request, response) -> {
            log.error("my error", new RuntimeException("some error"));
            return "failure";
        });
    }
}
