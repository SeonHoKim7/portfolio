package com.ourstyle.portfolio.controller;

import com.ourstyle.portfolio.domain.*;
import com.ourstyle.portfolio.domain.Person;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class SimpleRestController {
//    @GetMapping("/ajax")
//    public String ajax() {
//        return "ajax"; // 뷰이름
//    }

    @GetMapping("/test")
    public String test() {
        return "test"; // 뷰이름
    }

    @PostMapping("/send")
    @ResponseBody
    public Person test(@RequestBody Person p) {
        System.out.println("p = " + p);
        p.setName("ABC");
        p.setAge(p.getAge() + 10);

        return p;
    }
}