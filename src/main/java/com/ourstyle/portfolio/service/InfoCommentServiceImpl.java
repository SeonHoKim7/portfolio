package com.ourstyle.portfolio.service;

import com.ourstyle.portfolio.dao.InfoBoardDao;
import com.ourstyle.portfolio.dao.InfoCommentDao;
import com.ourstyle.portfolio.domain.CommentDto;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class InfoCommentServiceImpl implements InfoCommentService {

//    @Autowired
    InfoBoardDao infoBoardDao;
//    @Autowired
    InfoCommentDao infoCommentDao;

//    @Autowired
    public InfoCommentServiceImpl(InfoCommentDao infoCommentDao, InfoBoardDao infoBoardDao) {
        this.infoCommentDao = infoCommentDao;
        this.infoBoardDao = infoBoardDao;
    }

    @Override
    public int getCount(Integer bno) throws Exception {
        return infoCommentDao.count(bno);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer cno, Integer bno, String commenter) throws Exception {
        int rowCnt = infoBoardDao.updateCommentCnt(bno, -1);
        System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
//        throw new Exception("test");
        rowCnt = infoCommentDao.delete(cno, commenter);
        System.out.println("rowCnt = " + rowCnt);
        return rowCnt;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(CommentDto commentDto) throws Exception {
        infoBoardDao.updateCommentCnt(commentDto.getBno(), 1);
//                throw new Exception("test");
        return infoCommentDao.insert(commentDto);
    }

    @Override
    public List<CommentDto> getList(Integer bno) throws Exception {
//        throw new Exception("test");
        return infoCommentDao.selectAll(bno);
    }

    @Override
    public CommentDto read(Integer cno) throws Exception {
        return infoCommentDao.select(cno);
    }

    @Override
    public int modify(CommentDto commentDto) throws Exception {
        return infoCommentDao.update(commentDto);
    }
}