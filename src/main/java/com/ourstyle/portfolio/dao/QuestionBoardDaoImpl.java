package com.ourstyle.portfolio.dao;

import com.ourstyle.portfolio.domain.BoardDto;
import com.ourstyle.portfolio.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class QuestionBoardDaoImpl implements QuestionBoardDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.ourstyle.portfolio.dao.BoardMapper.";

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"questioncount");
    } // T selectOne(String statement)

    @Override
    public int deleteAll() {
        return session.delete(namespace+"questiondeleteall");
    } // int delete(String statement)

    @Override
    public int delete(Integer bno, String writer) throws Exception {
        Map map = new HashMap();
        map.put("bno", bno);
        map.put("writer", writer);
        return session.delete(namespace+"questiondelete", map);
    } // int delete(String statement, Object parameter)

    @Override
    public int insert(BoardDto dto) throws Exception {
        return session.insert(namespace+"questioninsert", dto);
    } // int insert(String statement, Object parameter)


    @Override
    public List<BoardDto> selectAll() throws Exception {
        return session.selectList(namespace+"questionselectall");
    } // List<E> selectList(String statement)

    @Override
    public BoardDto select(Integer bno) throws Exception {
        return session.selectOne(namespace + "questionselect", bno);
    } // T selectOne(String statement, Object parameter)

    @Override
    public List<BoardDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"questionselectpage", map);
    } // List<E> selectList(String statement, Object parameter)

    @Override
    public int update(BoardDto dto) throws Exception {
        return session.update(namespace+"questionupdate", dto);
    } // int update(String statement, Object parameter)

    @Override
    public int increaseViewCnt(Integer bno) throws Exception {
        return session.update(namespace+"questionincreaseviewcnt", bno);
    } // int update(String statement, Object parameter)

    @Override
    public List<BoardDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace+"questionsearchselectpage", sc);
    } // List<E> selectList(String statement, Object parameter)

    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace+"questionsearchresultcnt", sc);
    } // T selectOne(String statement)

    @Override
    public int updateCommentCnt(Integer bno, int cnt) {
        Map map = new HashMap();
        map.put("cnt", cnt);
        map.put("bno", bno);
        return session.update(namespace + "questionupdatecommentcnt", map);
    }
}