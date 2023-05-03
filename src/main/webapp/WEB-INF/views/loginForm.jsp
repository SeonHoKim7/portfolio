<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OurSytle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <style>
        * { box-sizing:border-box; }
        a { text-decoration: none; }
        form {
            width:400px;
            height:500px;
            display : flex;
            flex-direction: column;
            align-items:center;
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border: 1px solid rgb(89,117,196);
            border-radius: 10px;
        }
        input[type='text'], input[type='password'] {
            width: 300px;
            height: 40px;
            border : 1px solid rgb(89,117,196);
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }
        button {
            background-color: rgb(89,117,196);
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }
        #title {
            font-size : 40px;
            margin: 40px 0 30px 0;
        }
        #msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }
        .visible {
            display: none;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container">
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
                </ul>
            </div>
        </div>
    </div>
</nav>
<form action="<c:url value="/login/login"/>" method="post" onsubmit="return formCheck(this);">
    <h3 id="title">로그인</h3>
    <div id="msg">
        <c:if test="${not empty param.msg}">
            <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
        </c:if>
    </div>
    <input type="text" name="id" value="${cookie.id.value}" placeholder="아이디" autofocus>
    <input type="password" name="pwd" placeholder="비밀번호">
    <input type="hidden" name="toURL" value="${param.toURL}">
    <button>확인</button>
    <div>
        <label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label> |
        <a href="<c:url value='/register/add'/>">회원가입</a>
    </div>
    <script>
        function formCheck(frm) {
            let msg ='';
            if(frm.id.value.length==0) {
                setMessage('id를 입력해주세요.', frm.id);
                return false;
            }
            if(frm.pwd.value.length==0) {
                setMessage('password를 입력해주세요.', frm.pwd);
                return false;
            }
            return true;
        }
        function setMessage(msg, element){
            document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
            if(element) {
                element.select();
            }
        }
    </script>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
</body>
</html>