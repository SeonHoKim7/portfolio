package com.ourstyle.portfolio.dao;

import com.ourstyle.portfolio.domain.*;
import com.ourstyle.portfolio.domain.BoardDto;
import com.ourstyle.portfolio.domain.SearchCondition;
import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import java.util.*;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.ourstyle.portfolio.dao.BoardMapper.";

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"noticecount");
    } // T selectOne(String statement)

    @Override
    public int deleteAll() {
        return session.delete(namespace+"noticedeleteall");
    } // int delete(String statement)

    @Override
    public int delete(Integer bno, String writer) throws Exception {
        Map map = new HashMap();
        map.put("bno", bno);
        map.put("writer", writer);
        return session.delete(namespace+"noticedelete", map);
    } // int delete(String statement, Object parameter)

    @Override
    public int insert(BoardDto dto) throws Exception {
        return session.insert(namespace+"noticeinsert", dto);
    } // int insert(String statement, Object parameter)


    @Override
    public List<BoardDto> selectAll() throws Exception {
        return session.selectList(namespace+"noticeselectall");
    } // List<E> selectList(String statement)

    @Override
    public BoardDto select(Integer bno) throws Exception {
        return session.selectOne(namespace + "noticeselect", bno);
    } // T selectOne(String statement, Object parameter)

    @Override
    public List<BoardDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"noticeselectpage", map);
    } // List<E> selectList(String statement, Object parameter)

    @Override
    public int update(BoardDto dto) throws Exception {
        return session.update(namespace+"noticeupdate", dto);
    } // int update(String statement, Object parameter)

    @Override
    public int increaseViewCnt(Integer bno) throws Exception {
        return session.update(namespace+"noticeincreaseviewcnt", bno);
    } // int update(String statement, Object parameter)

    @Override
    public List<BoardDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace+"noticesearchselectpage", sc);
    } // List<E> selectList(String statement, Object parameter)

    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace+"noticesearchresultcnt", sc);
    } // T selectOne(String statement)

    @Override
    public int updateCommentCnt(Integer bno, int cnt) {
        Map map = new HashMap();
        map.put("cnt", cnt);
        map.put("bno", bno);
        return session.update(namespace + "noticeupdatecommentcnt", map);
    }
}