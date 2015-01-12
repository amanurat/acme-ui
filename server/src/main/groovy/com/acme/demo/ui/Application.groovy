package com.acme.demo.ui

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.cloud.client.discovery.EnableDiscoveryClient

/**
 * This application merely serves the client angular application.
 * Nothing here really needs to be secured.
 */
@SpringBootApplication
@EnableDiscoveryClient
class Application{

    static void main(String[] args) {
        SpringApplication.run Application, args
    }
}
