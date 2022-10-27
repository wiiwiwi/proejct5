package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class TestController_POJO implements Controller{

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

			System.out.println("도달 확인");
			
			ModelAndView mv1 = new ModelAndView("test");
			mv1.addObject("data1", "스프링 MVC의 모델이에요");
//			mv1.setViewName("test.jsp");
			
		
		return mv1;
	}

}
