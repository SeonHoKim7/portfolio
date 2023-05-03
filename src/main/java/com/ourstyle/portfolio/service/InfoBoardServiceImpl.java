package com.ourstyle.portfolio.service;

import com.ourstyle.portfolio.dao.InfoBoardDao;
import com.ourstyle.portfolio.domain.BoardDto;
import com.ourstyle.portfolio.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class InfoBoardServiceImpl implements InfoBoardService {
    @Autowired
    InfoBoardDao infoBoardDao;

    @Override
    public List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return infoBoardDao.searchSelectPage(sc);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return infoBoardDao.searchResultCnt(sc);
    }

    @Override
    public int getCount() throws Exception {
        return infoBoardDao.count();
    }

    @Override
    public int remove(Integer bno, String writer) throws Exception {
        return infoBoardDao.delete(bno, writer);
    }

    @Override
    public int write(BoardDto boardDto) throws Exception {
//        throw new Exception("test");
        return infoBoardDao.insert(boardDto);
    }

    @Override
    public List<BoardDto> getList() throws Exception {
        return infoBoardDao.selectAll();
    }

    @Override
    public BoardDto read(Integer bno) throws Exception {
        BoardDto boardDto = infoBoardDao.select(bno);
        infoBoardDao.increaseViewCnt(bno);

        return boardDto;
    }

    @Override
    public List<BoardDto> getPage(Map map) throws Exception {
        return infoBoardDao.selectPage(map);
    }

    @Override
    public int modify(BoardDto boardDto) throws Exception {
        return infoBoardDao.update(boardDto);
    }

}