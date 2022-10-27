package com.example.controller;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration // 서블릿 콘텍스트를 사용하겠다는 의미.

@ContextConfiguration(classes = {com.example.config.RootConfig.class, com.example.config.ServletConfig.class})
@Log4j
public class ReplyControllerTest {

}
