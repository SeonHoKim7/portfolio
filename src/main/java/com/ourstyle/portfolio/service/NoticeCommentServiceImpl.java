package com.ourstyle.portfolio.service;

import com.ourstyle.portfolio.dao.NoticeBoardDao;
import com.ourstyle.portfolio.dao.NoticeCommentDao;
import com.ourstyle.portfolio.domain.CommentDto;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NoticeCommentServiceImpl implements NoticeCommentService {

//    @Autowired
    NoticeBoardDao noticeBoardDao;
//    @Autowired
    NoticeCommentDao noticeCommentDao;

//    @Autowired
    public NoticeCommentServiceImpl(NoticeCommentDao noticeCommentDao, NoticeBoardDao noticeBoardDao) {
        this.noticeCommentDao = noticeCommentDao;
        this.noticeBoardDao = noticeBoardDao;
    }

    @Override
    public int getCount(Integer bno) throws Exception {
        return noticeCommentDao.count(bno);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer cno, Integer bno, String commenter) throws Exception {
        int rowCnt = noticeBoardDao.updateCommentCnt(bno, -1);
        System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
//        throw new Exception("test");
        rowCnt = noticeCommentDao.delete(cno, commenter);
        System.out.println("rowCnt = " + rowCnt);
        return rowCnt;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(CommentDto commentDto) throws Exception {
        noticeBoardDao.updateCommentCnt(commentDto.getBno(), 1);
//                throw new Exception("test");
        return noticeCommentDao.insert(commentDto);
    }

    @Override
    public List<CommentDto> getList(Integer bno) throws Exception {
//        throw new Exception("test");
        return noticeCommentDao.selectAll(bno);
    }

    @Override
    public CommentDto read(Integer cno) throws Exception {
        return noticeCommentDao.select(cno);
    }

    @Override
    public int modify(CommentDto commentDto) throws Exception {
        return noticeCommentDao.update(commentDto);
    }
}