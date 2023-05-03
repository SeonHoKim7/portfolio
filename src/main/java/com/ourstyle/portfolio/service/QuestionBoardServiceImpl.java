package com.ourstyle.portfolio.service;

import com.ourstyle.portfolio.dao.QuestionBoardDao;
import com.ourstyle.portfolio.domain.BoardDto;
import com.ourstyle.portfolio.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class QuestionBoardServiceImpl implements QuestionBoardService {
    @Autowired
    QuestionBoardDao questionBoardDao;

    @Override
    public List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return questionBoardDao.searchSelectPage(sc);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return questionBoardDao.searchResultCnt(sc);
    }

    @Override
    public int getCount() throws Exception {
        return questionBoardDao.count();
    }

    @Override
    public int remove(Integer bno, String writer) throws Exception {
        return questionBoardDao.delete(bno, writer);
    }

    @Override
    public int write(BoardDto boardDto) throws Exception {
//        throw new Exception("test");
        return questionBoardDao.insert(boardDto);
    }

    @Override
    public List<BoardDto> getList() throws Exception {
        return questionBoardDao.selectAll();
    }

    @Override
    public BoardDto read(Integer bno) throws Exception {
        BoardDto boardDto = questionBoardDao.select(bno);
        questionBoardDao.increaseViewCnt(bno);

        return boardDto;
    }

    @Override
    public List<BoardDto> getPage(Map map) throws Exception {
        return questionBoardDao.selectPage(map);
    }

    @Override
    public int modify(BoardDto boardDto) throws Exception {
        return questionBoardDao.update(boardDto);
    }

}