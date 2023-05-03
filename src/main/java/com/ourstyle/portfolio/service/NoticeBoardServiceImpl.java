package com.ourstyle.portfolio.service;

import com.ourstyle.portfolio.dao.*;
import com.ourstyle.portfolio.domain.*;
import com.ourstyle.portfolio.dao.NoticeBoardDao;
import com.ourstyle.portfolio.domain.BoardDto;
import com.ourstyle.portfolio.domain.SearchCondition;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import java.util.*;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
    @Autowired
    NoticeBoardDao noticeBoardDao;

    @Override
    public List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return noticeBoardDao.searchSelectPage(sc);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return noticeBoardDao.searchResultCnt(sc);
    }

    @Override
    public int getCount() throws Exception {
        return noticeBoardDao.count();
    }

    @Override
    public int remove(Integer bno, String writer) throws Exception {
        return noticeBoardDao.delete(bno, writer);
    }

    @Override
    public int write(BoardDto boardDto) throws Exception {
//        throw new Exception("test");
        return noticeBoardDao.insert(boardDto);
    }

    @Override
    public List<BoardDto> getList() throws Exception {
        return noticeBoardDao.selectAll();
    }

    @Override
    public BoardDto read(Integer bno) throws Exception {
        BoardDto boardDto = noticeBoardDao.select(bno);
        noticeBoardDao.increaseViewCnt(bno);

        return boardDto;
    }

    @Override
    public List<BoardDto> getPage(Map map) throws Exception {
        return noticeBoardDao.selectPage(map);
    }

    @Override
    public int modify(BoardDto boardDto) throws Exception {
        return noticeBoardDao.update(boardDto);
    }

}