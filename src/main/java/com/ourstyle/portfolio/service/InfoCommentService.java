package com.ourstyle.portfolio.service;

import com.ourstyle.portfolio.domain.CommentDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface InfoCommentService {
    int getCount(Integer bno) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int remove(Integer cno, Integer bno, String commenter) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int write(CommentDto commentDto) throws Exception;

    List<CommentDto> getList(Integer bno) throws Exception;

    CommentDto read(Integer cno) throws Exception;

    int modify(CommentDto commentDto) throws Exception;
}
