package com.ourstyle.portfolio.controller;


import com.ourstyle.portfolio.domain.BoardDto;
import com.ourstyle.portfolio.domain.PageHandler;
import com.ourstyle.portfolio.domain.SearchCondition;
import com.ourstyle.portfolio.service.QuestionBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/questionboard")
public class QuestionBoardController {

    @Autowired
    QuestionBoardService questionBoardService;

    @PostMapping("/modify")
    public String modify(BoardDto boardDto, Model m, HttpSession session, RedirectAttributes rattr) {
        String writer = (String)session.getAttribute("id");
        boardDto.setWriter(writer);

        try {
            int rowCnt = questionBoardService.modify(boardDto); // insert

            if(rowCnt != 1)
                throw new Exception("Modify failed");

            rattr.addFlashAttribute("msg", "MOD_OK");

            return "redirect:/questionboard/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto);
            m.addAttribute("msg", "MOD_ERR");
            return "questionboard";
        }
    }

    @PostMapping("/write")
    public String write(BoardDto boardDto, Model m, HttpSession session, RedirectAttributes rattr) {
        String writer = (String)session.getAttribute("id");
        boardDto.setWriter(writer);

        try {
            int rowCnt = questionBoardService.write(boardDto); // insert

            if(rowCnt != 1)
                throw new Exception("Write failed");

            rattr.addFlashAttribute("msg", "WRT_OK");

            return "redirect:/questionboard/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto);
            m.addAttribute("msg", "WRT_ERR");
            return "questionboard";
        }
    }

    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");
        return "questionboard"; // 읽기와 쓰기에 사용. 쓰기에 사용할때는 mode=new
    }

    @PostMapping("/remove")
    public String remove(Integer bno, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr) {
        String writer = (String)session.getAttribute("id");

        try {
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);

            int rowCnt = questionBoardService.remove(bno, writer);

            if(rowCnt!=1)
                throw new Exception("board remove error");

            rattr.addFlashAttribute("msg", "DEL_OK");

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DEL_ERR");
        }

        return "redirect:/questionboard/list";
    }

    @GetMapping("/read")
    public String read(Integer bno, Integer page, Integer pageSize, Model m) {
        try {
            BoardDto boardDto = questionBoardService.read(bno);
//            m.addAttribute("boardDto", boardDto); // 아래 문장과 동일
            m.addAttribute(boardDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "questionboard";
    }

    @GetMapping("/list")
    public String list(SearchCondition sc, Model m, HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

        try {
            int totalCnt = questionBoardService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);

            PageHandler pageHandler = new PageHandler(totalCnt, sc);

            List<BoardDto> list = questionBoardService.getSearchResultPage(sc);
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "questionboardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id")!=null;
    }
}