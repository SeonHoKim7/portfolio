<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OurSytle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Noto Sans KR", sans-serif;
        }
        .container {
            width : 50%;
            margin : auto;
        }
        .board-container {
            width: 50%;
            height: 1200px;
            margin: 0 auto;
            /* border: 1px solid black; */
        }
        .writing-header {
            position: relative;
            margin: 20px 0 0 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #323232;
        }
        input {
            width: 100%;
            height: 35px;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            padding: 8px;
            background: #f8f8f8;
            outline-color: #e6e6e6;
        }
        textarea {
            width: 100%;
            background: #f8f8f8;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            resize: none;
            padding: 8px;
            outline-color: #e6e6e6;
        }
        .frm {
            width:100%;
        }
        .btn {
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
        }
        .btn:hover {
            text-decoration: underline;
        }
        .visible {
            display: none;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="<c:url value='/'/>">
                    <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fd7OEAD%2Fbtr7eWRPp7d%2FZWRy4aq87KrpWVjOayx1SK%2Fimg.png" alt="Logo" width="50" height="35" class="d-inline-block align-text-top">
                    OurStyle
                </a>
            </div>
        </nav>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <div class="col-10">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<c:url value='/noticeboard/list'/>">공지사항</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/board/list'/>">자유게시판</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/infoboard/list'/>">정보공유</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/questionboard/list'/>">질의응답</a>
                    </li>
                    <li class="nav-item visible">
                        <a class="nav-link" href="<c:url value='/board/list'/>">데일리룩</a>
                    </li>
            </div>
            <div class="col-3">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='${loginOutLink}'/>">${loginOut}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/register/add'/>">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="container">
    <h2 class="writing-header">게시글 ${mode=="new" ? "글쓰기" : "읽기"}</h2>
    <form id="form" class="frm" action="" method="post">
        <input type="hidden" name="bno" value="${boardDto.bno}">

        <input name="title" type="text" value="<c:out value='${boardDto.title}'/>" placeholder= " 제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><br>
        <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><c:out value="${boardDto.content}"/></textarea><br>

        <c:if test="${mode eq 'new'}">
            <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
        </c:if>
        <c:if test="${mode ne 'new'}">
            <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 글쓰기</button>
        </c:if>
        <c:if test="${boardDto.writer eq loginId}">
            <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
            <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
        </c:if>
        <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
    </form>
</div>
<br>
<c:if test="${mode ne 'new'}">
    <div class="board-container">
        <hr />
        댓글 작성: <input type="text" name="comment"><br>
        <button id="sendBtn" type="button">등록</button>
        <button id="modBtn" type="button">수정</button>

        <div id="commentList"></div>
        <div id="replyForm" style="display:none">
            <input type="text" name="replyComment">
            <button id="wrtRepBtn" type="button">등록</button>
        </div>
    </div>
</c:if>

<script>

    $(document).ready(function(){
        let formCheck = function() {
            let form = document.getElementById("form");
            if(form.title.value=="") {
                alert("제목을 입력해 주세요.");
                form.title.focus();
                return false;
            }
            if(form.content.value=="") {
                alert("내용을 입력해 주세요.");
                form.content.focus();
                return false;
            }
            return true;
        }
        $("#writeNewBtn").on("click", function(){
            location.href="<c:url value='/board/write'/>";
        });
        $("#writeBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/board/write'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });

        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            let isReadonly = $("input[name=title]").attr('readonly');
            // 1. 읽기 상태이면, 수정 상태로 변경
            if(isReadonly=='readonly') {
                $(".writing-header").html("게시판 수정");
                $("input[name=title]").attr('readonly', false);
                $("textarea").attr('readonly', false);
                $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
                return;
            }
            // 2. 수정 상태이면, 수정된 내용을 서버로 전송
            form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });

        $("#removeBtn").on("click", function(){
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/board/remove${searchCondition.queryString}'/>");
            form.attr("method", "post");
            form.submit();
        });
        $("#listBtn").on("click", function(){
            location.href="<c:url value='/board/list${searchCondition.queryString}'/>";
        });
    });


    let bno = "${boardDto.bno}"; //

    let showList = function(bno) {
        $.ajax({
            type:'GET',       // 요청 메서드
            url: '/portfolio/comments?bno=' + bno,  // 요청 URI
            success : function(result){
                $("#commentList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }
    $(document).ready(function(){
        showList(bno);

        $("#modBtn").click(function(){
            let cno = $(this).attr("data-cno");
            let comment = $("input[name=comment]").val().replace(/\</g, "&lt;").replace(/\>/g, "&gt;");

            if(comment.trim()=='') {
                alert("댓글을 입력해주세요.");
                $("input[name=comment]").focus()
                return;
            }

            $.ajax({
                type:'PATCH',       // 요청 메서드
                url: '/portfolio/comments/' + cno,  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({cno:cno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $("#wrtRepBtn").click(function(){

            let comment = $("input[name=replyComment]").val().replace(/\</g, "&lt;").replace(/\>/g, "&gt;");
            let pcno = $("#replyForm").parent().attr("data-pcno");

            if(comment.trim()=='') {
                alert("댓글을 입력해주세요.");
                $("input[name=replyComment]").focus()
                return;
            }

            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/portfolio/comments?bno=' + bno,  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({pcno:pcno, bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

            $("#replyForm").css("display", "none")
            $("input[name=replyComment]").val('')
            $('#replyForm').appendTo("body");
        });

        $("#sendBtn").click(function(){
            let comment = $("input[name=comment]").val().replace(/\</g, "&lt;").replace(/\>/g, "&gt;");

            if(comment.trim()=='') {
                alert("댓글을 입력해주세요.");
                $("input[name=comment]").focus()
                return;
            }

            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/portfolio/comments?bno=' + bno,  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $("#commentList").on("click", ".modBtn", function(){
            let cno = $(this).parent().attr("data-cno");
            let comment = $("span.comment", $(this).parent()).text();

            // 1. comment의 내용을 input에 뿌려주기
            $("input[name=comment]").val(comment);
            // 2. cno 전달하기
            $("#modBtn").attr("data-cno", cno);

        });

        $("#commentList").on("click", ".replyBtn", function(){
            // 1. replyForm을 옮긴다.
            $("#replyForm").appendTo($(this).parent());

            // 2. 답글을 입력할 폼을 보여준다.
            $("#replyForm").css("display", "block");
        });

        $("#commentList").on("click", ".delBtn", function(){
            let cno = $(this).parent().attr("data-cno");
            let bno = $(this).parent().attr("data-bno");

            $.ajax({
                type:'DELETE',       // 요청 메서드
                url: '/portfolio/comments/' + cno + '?bno=' + bno,  // 요청 URI
                success : function(result){
                    alert(result)
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });
    });


    let toHtml = function(comments) {
        let tmp = "<ul>";

        comments.forEach(function(comment){
            tmp += '<hr />'
            tmp += '<li data-cno=' + comment.cno
            tmp += ' data-pcno=' + comment.pcno
            tmp += ' data-bno=' + comment.bno + '>'
            if(comment.cno != comment.pcno)
                tmp += 'ㄴ'
            tmp += '<span class="commenter">' + comment.commenter + ' /</span>'
            tmp += '&nbsp'
            tmp +=  comment.up_date
            tmp += '<br>'
            tmp += '<div style = "word-break:break-all"><span class="comment">' + comment.comment + '</span></div>'
            tmp += '&nbsp'
            tmp += '<button class="delBtn">삭제</button>'
            tmp += '&nbsp'
            tmp += '<button class="modBtn">수정</button>'
            tmp += '&nbsp'
            tmp += '<button class="replyBtn">답글</button>'
            tmp += '</li>'
        })

        return tmp + "</ul>";
    }
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
</body>
</html>