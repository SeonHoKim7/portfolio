package com.ourstyle.portfolio.dao;

import com.ourstyle.portfolio.domain.BoardDto;
import com.ourstyle.portfolio.domain.SearchCondition;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class NoticeBoardDaoImplTest {
    @Autowired
    private NoticeBoardDao noticeBoardDao;

    @Test
    public void searchSelectPageTest() throws Exception {
        noticeBoardDao.deleteAll();
        for (int i = 1; i <= 20; i++) {
            BoardDto boardDto = new BoardDto("title"+i, "asdfasdfasdf", "asdf"+i);
            noticeBoardDao.insert(boardDto);
        }
        SearchCondition sc = new SearchCondition(1, 10, "asdf2", "W"); // asdf2%
        List<BoardDto> list = noticeBoardDao.searchSelectPage(sc);
        System.out.println("list = " + list);
        assertTrue(list.size()==2); // asdf2, asdf20
    }

    @Test
    public void searchResultCnt() throws Exception {
        noticeBoardDao.deleteAll();
        for (int i = 1; i <= 150; i++) {
            BoardDto boardDto = new BoardDto("title"+i, "asdfasdfasdf", "asdf"+i);
            noticeBoardDao.insert(boardDto);
        }

        SearchCondition sc = new SearchCondition(1, 10, "title2", "T"); // title2%
        int cnt = noticeBoardDao.searchResultCnt(sc);
        assertTrue(cnt==2); // title2, title20

        sc = new SearchCondition(1, 10, "asdf2", "W"); // asdf2%
        cnt = noticeBoardDao.searchResultCnt(sc);
        assertTrue(cnt==2); // asdf2, asdf20
    }

    @Test
    public void insertTestData() throws Exception {
        noticeBoardDao.deleteAll();
        for (int i = 1; i < 220; i++) {
            BoardDto boardDto = new BoardDto("title" + i, "no content", "asdf");
            noticeBoardDao.insert(boardDto);
        }
    }

    @Test
    public void countTest() throws Exception {
        noticeBoardDao.deleteAll();
        assertTrue(noticeBoardDao.count()==0);

        BoardDto boardDto = new BoardDto("no title", "no content", "asdf");
        assertTrue(noticeBoardDao.insert(boardDto)==1);
        assertTrue(noticeBoardDao.count()==1);

        assertTrue(noticeBoardDao.insert(boardDto)==1);
        assertTrue(noticeBoardDao.count()==2);
    }

    @Test
    public void deleteAllTest() throws Exception {
        noticeBoardDao.deleteAll();
        assertTrue(noticeBoardDao.count()==0);

        BoardDto boardDto = new BoardDto("no title", "no content", "asdf");
        assertTrue(noticeBoardDao.insert(boardDto)==1);
        assertTrue(noticeBoardDao.deleteAll()==1);
        assertTrue(noticeBoardDao.count()==0);

        boardDto = new BoardDto("no title", "no content", "asdf");
        assertTrue(noticeBoardDao.insert(boardDto)==1);
        assertTrue(noticeBoardDao.insert(boardDto)==1);
        assertTrue(noticeBoardDao.deleteAll()==2);
        assertTrue(noticeBoardDao.count()==0);
    }

    @Test
    public void deleteTest() throws Exception {
        noticeBoardDao.deleteAll();
        assertTrue(noticeBoardDao.count()==0);

        BoardDto boardDto = new BoardDto("no title", "no content", "asdf");
        assertTrue(noticeBoardDao.insert(boardDto)==1);
        Integer bno = noticeBoardDao.selectAll().get(0).getBno();
        assertTrue(noticeBoardDao.delete(bno, boardDto.getWriter())==1);
        assertTrue(noticeBoardDao.count()==0);

        assertTrue(noticeBoardDao.insert(boardDto)==1);
        bno = noticeBoardDao.selectAll().get(0).getBno();
        assertTrue(noticeBoardDao.delete(bno, boardDto.getWriter()+"222")==0);
        assertTrue(noticeBoardDao.count()==1);

        assertTrue(noticeBoardDao.delete(bno, boardDto.getWriter())==1);
        assertTrue(noticeBoardDao.count()==0);

        assertTrue(noticeBoardDao.insert(boardDto)==1);
        bno = noticeBoardDao.selectAll().get(0).getBno();
        assertTrue(noticeBoardDao.delete(bno+1, boardDto.getWriter())==0);
        assertTrue(noticeBoardDao.count()==1);
    }

    @Test
    public void insertTest() throws Exception {
        noticeBoardDao.deleteAll();
        BoardDto boardDto = new BoardDto("no title", "no content", "asdf");
        assertTrue(noticeBoardDao.insert(boardDto)==1);

        boardDto = new BoardDto("no title", "no content", "asdf");
        assertTrue(noticeBoardDao.insert(boardDto)==1);
        assertTrue(noticeBoardDao.count()==2);

        noticeBoardDao.deleteAll();
        boardDto = new BoardDto("no title", "no content", "asdf");
        assertTrue(noticeBoardDao.insert(boardDto)==1);
        assertTrue(noticeBoardDao.count()==1);
    }

    @Test
    public void selectAllTest() throws Exception {
        noticeBoardDao.deleteAll();
        assertTrue(noticeBoardDao.count()==0);

        List<BoardDto> list = noticeBoardDao.selectAll();
        assertTrue(list.size() == 0);

        BoardDto boardDto = new BoardDto("no title", "no content", "asdf");
        assertTrue(noticeBoardDao.insert(boardDto)==1);

        list = noticeBoardDao.selectAll();
        assertTrue(list.size() == 1);

        assertTrue(noticeBoardDao.insert(boardDto)==1);
        list = noticeBoardDao.selectAll();
        assertTrue(list.size() == 2);
    }

    @Test
    public void selectTest() throws Exception {
        noticeBoardDao.deleteAll();
        assertTrue(noticeBoardDao.count()==0);

        BoardDto boardDto = new BoardDto("no title", "no content", "asdf");
        assertTrue(noticeBoardDao.insert(boardDto)==1);

        Integer bno = noticeBoardDao.selectAll().get(0).getBno();
        boardDto.setBno(bno);
        BoardDto boardDto2 = noticeBoardDao.select(bno);
        assertTrue(boardDto.equals(boardDto2));
    }

    @Test
    public void selectPageTest() throws Exception {
        noticeBoardDao.deleteAll();

        for (int i = 1; i <= 10; i++) {
            BoardDto boardDto = new BoardDto(""+i, "no content"+i, "asdf");
            noticeBoardDao.insert(boardDto);
        }

        Map map = new HashMap();
        map.put("offset", 0);
        map.put("pageSize", 3);

        List<BoardDto> list = noticeBoardDao.selectPage(map);
        assertTrue(list.get(0).getTitle().equals("10"));
        assertTrue(list.get(1).getTitle().equals("9"));
        assertTrue(list.get(2).getTitle().equals("8"));

        map = new HashMap();
        map.put("offset", 0);
        map.put("pageSize", 1);

        list = noticeBoardDao.selectPage(map);
        assertTrue(list.get(0).getTitle().equals("10"));

        map = new HashMap();
        map.put("offset", 7);
        map.put("pageSize", 3);

        list = noticeBoardDao.selectPage(map);
        assertTrue(list.get(0).getTitle().equals("3"));
        assertTrue(list.get(1).getTitle().equals("2"));
        assertTrue(list.get(2).getTitle().equals("1"));
    }

    @Test
    public void updateTest() throws Exception {
        noticeBoardDao.deleteAll();
        BoardDto boardDto = new BoardDto("no title", "no content", "asdf");
        assertTrue(noticeBoardDao.insert(boardDto)==1);

        Integer bno = noticeBoardDao.selectAll().get(0).getBno();
        System.out.println("bno = " + bno);
        boardDto.setBno(bno);
        boardDto.setTitle("yes title");
        assertTrue(noticeBoardDao.update(boardDto)==1);

        BoardDto boardDto2 = noticeBoardDao.select(bno);
        assertTrue(boardDto.equals(boardDto2));
    }

    @Test
    public void increaseViewCntTest() throws Exception {
        noticeBoardDao.deleteAll();
        assertTrue(noticeBoardDao.count()==0);

        BoardDto boardDto = new BoardDto("no title", "no content", "asdf");
        assertTrue(noticeBoardDao.insert(boardDto)==1);
        assertTrue(noticeBoardDao.count()==1);

        Integer bno = noticeBoardDao.selectAll().get(0).getBno();
        assertTrue(noticeBoardDao.increaseViewCnt(bno)==1);

        boardDto = noticeBoardDao.select(bno);
        assertTrue(boardDto!=null);
        assertTrue(boardDto.getView_cnt() == 1);

        assertTrue(noticeBoardDao.increaseViewCnt(bno)==1);
        boardDto = noticeBoardDao.select(bno);
        assertTrue(boardDto!=null);
        assertTrue(boardDto.getView_cnt() == 2);
    }
}