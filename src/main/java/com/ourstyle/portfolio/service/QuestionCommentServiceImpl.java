package com.ourstyle.portfolio.service;

import com.ourstyle.portfolio.dao.QuestionBoardDao;
import com.ourstyle.portfolio.dao.QuestionCommentDao;
import com.ourstyle.portfolio.domain.CommentDto;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class QuestionCommentServiceImpl implements QuestionCommentService {

//    @Autowired
    QuestionBoardDao questionBoardDao;
//    @Autowired
    QuestionCommentDao questionCommentDao;

//    @Autowired
    public QuestionCommentServiceImpl(QuestionCommentDao questionCommentDao, QuestionBoardDao questionBoardDao) {
        this.questionCommentDao = questionCommentDao;
        this.questionBoardDao = questionBoardDao;
    }

    @Override
    public int getCount(Integer bno) throws Exception {
        return questionCommentDao.count(bno);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer cno, Integer bno, String commenter) throws Exception {
        int rowCnt = questionBoardDao.updateCommentCnt(bno, -1);
        System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
//        throw new Exception("test");
        rowCnt = questionCommentDao.delete(cno, commenter);
        System.out.println("rowCnt = " + rowCnt);
        return rowCnt;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(CommentDto commentDto) throws Exception {
        questionBoardDao.updateCommentCnt(commentDto.getBno(), 1);
//                throw new Exception("test");
        return questionCommentDao.insert(commentDto);
    }

    @Override
    public List<CommentDto> getList(Integer bno) throws Exception {
//        throw new Exception("test");
        return questionCommentDao.selectAll(bno);
    }

    @Override
    public CommentDto read(Integer cno) throws Exception {
        return questionCommentDao.select(cno);
    }

    @Override
    public int modify(CommentDto commentDto) throws Exception {
        return questionCommentDao.update(commentDto);
    }
}