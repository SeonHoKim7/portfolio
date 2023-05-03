package com.ourstyle.portfolio.dao;

import com.ourstyle.portfolio.domain.CommentDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class NoticeCommentDaoImpl implements NoticeCommentDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.ourstyle.portfolio.dao.CommentMapper.";

    @Override
    public int count(Integer bno) throws Exception {
        return session.selectOne(namespace+"noticeCount", bno);
    } // T selectOne(String statement)

    @Override
    public int deleteAll(Integer bno) {
        return session.delete(namespace+"noticeDeleteAll", bno);
    } // int delete(String statement)

    @Override
    public int delete(Integer cno, String commenter) throws Exception {
        Map map = new HashMap();
        map.put("cno", cno);
        map.put("commenter", commenter);
        return session.delete(namespace+"noticeDelete", map);
    } // int delete(String statement, Object parameter)

    @Override
    public int insert(CommentDto dto) throws Exception {
        return session.insert(namespace+"noticeInsert", dto);
    } // int insert(String statement, Object parameter)

    @Override
    public List<CommentDto> selectAll(Integer bno) throws Exception {
        return session.selectList(namespace+"noticeSelectAll", bno);
    } // List<E> selectList(String statement)

    @Override
    public CommentDto select(Integer cno) throws Exception {
        return session.selectOne(namespace + "noticeSelect", cno);
    } // T selectOne(String statement, Object parameter)

    @Override
    public int update(CommentDto dto) throws Exception {
        return session.update(namespace+"noticeUpdate", dto);
    } // int update(String statement, Object parameter)
}