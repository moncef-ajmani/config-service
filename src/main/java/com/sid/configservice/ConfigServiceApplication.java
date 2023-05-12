package com.sid.configservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@EnableConfigServer
@SpringBootApplication
@RestController
public class ConfigServiceApplication {

    @GetMapping("/hello")
    public String helloWorld(){
        return "Hello from Config Service";
    }
    public static void main(String[] args) {
        SpringApplication.run(ConfigServiceApplication.class, args);
    }

}
