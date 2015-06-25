package com.thoughtworks.library;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by tcruz on 6/25/15.
 */
@RestController
public class HomeController {

    @RequestMapping("/")
    public String index() {
        return "library server is up";
    }

}