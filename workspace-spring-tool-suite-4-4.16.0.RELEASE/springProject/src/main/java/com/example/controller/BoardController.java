package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/register")
	public void register() {
		
	}
//	@GetMapping("/list")
//	public void list(Model model){
//		log.info("list");
//		model.addAttribute("list", service.getList());
//	}
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri){
		log.info("list " + cri);
		model.addAttribute("list", service.getList(cri));
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr){
		log.info("register: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	
	@GetMapping({"/get", "/modify" }) // 3. 검색.
	public void get(@RequestParam("bno") Long bno, Model model){
		log.info("/get");
		model.addAttribute("board", service.get(bno));
	}
	
	
	@PostMapping("/modify") //4. 수정.
	public String modify(BoardVO board, RedirectAttributes rttr){
		log.info("modify:" + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
		
	}
//	@PostMapping("/remove")
//	@GetMapping("/remove")
	@RequestMapping(value = "/remove", method = {RequestMethod.GET, RequestMethod.POST}) // GET과 POST로 모두 받기.
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr){
		
		log.info("remove..." + bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
}
