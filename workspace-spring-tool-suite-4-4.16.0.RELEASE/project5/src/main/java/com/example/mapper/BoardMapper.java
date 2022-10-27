package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
//@Select("select * from tbl_board where bno >0")
public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public Integer insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bon);
	
	public int update(BoardVO board);
}
