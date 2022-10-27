package com.example.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.Criteria;
import com.example.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { com.example.config.RootConfig.class })
@Log4j
public class ReplyControllerTest {

	@Setter(onMethod_ = @Autowired)
	ReplyMapper replyMapper;

//	@Test
	public void insertTest() {
		ReplyVO vo = new ReplyVO();

		vo.setBno((long) 16);
		vo.setReply("테스트");
		vo.setReplyer("테스트자");

		replyMapper.insert(vo);

		log.info(vo);
	}

//	@Test
	public void readTest() {
		Long rno = (long) 2;
		ReplyVO vo = replyMapper.read(rno);

		log.info(vo);
	}

//	@Test
	public void deleteTest() {
		Long rno = (long) 2;
		int a = replyMapper.delete(rno);

		log.info("delete..." + a);
	}

//	@Test
	public void updateTest() { //update는 rno와 reply 값 밖에 쓰지 않음.
		ReplyVO vo = new ReplyVO();

		vo.setRno((long) 6);
		vo.setReply("테스트(수정)");
		vo.setReplyer("테스트자(수정)");

		int a = replyMapper.update(vo);
		
		log.info(vo);
		log.info("update..." + a);
	}
	
//	@Test
	public void listTest() { //update는 rno와 reply 값 밖에 쓰지 않음.
		ReplyVO vo = new ReplyVO();

		Long bno = (long) 16;
		Criteria cri = new Criteria(1,5);
		
		log.info(replyMapper.getListWithPaging(cri, bno));
		log.info("list...");
	}
}
