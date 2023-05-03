<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? '로그인' : '로그아웃'}"/>
<c:set var="adminShowCheck" value="${loginId=='admin' ? 'visible' : 'hidden'}"/>
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
        a {
            text-decoration: none;
            color: black;
        }
        button,
        input {
            border: none;
            outline: none;
        }
        .board-container {
            width: 60%;
            height: 1200px;
            margin: 0 auto;
            /* border: 1px solid black; */
        }
        .search-container {
            background-color: rgb(253, 253, 250);
            width: 100%;
            height: 110px;
            border: 1px solid #ddd;
            margin-top : 10px;
            margin-bottom: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .search-form {
            height: 37px;
            display: flex;
        }
        .search-option {
            width: 100px;
            height: 100%;
            outline: none;
            margin-right: 5px;
            border: 1px solid #ccc;
            color: gray;
        }
        .search-option > option {
            text-align: center;
        }
        .search-input {
            color: gray;
            background-color: white;
            border: 1px solid #ccc;
            height: 100%;
            width: 300px;
            font-size: 15px;
            padding: 5px 7px;
        }
        .search-input::placeholder {
            color: gray;
        }
        .search-button {
            /* 메뉴바의 검색 버튼 아이콘  */
            width: 20%;
            height: 100%;
            background-color: rgb(22, 22, 22);
            color: rgb(209, 209, 209);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
        }
        .search-button:hover {
            color: rgb(165, 165, 165);
        }
        table {
            border-collapse: collapse;
            width: 100%;
            border-top: 2px solid rgb(39, 39, 39);
        }
        .ellipis {
            width: 400px;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }
        tr:nth-child(even) {
            background-color: #f0f0f070;
        }
        th,
        td {
            width:300px;
            text-align: center;
            padding: 10px 12px;
            border-bottom: 1px solid #ddd;
        }
        td {
            color: rgb(53, 53, 53);
        }
        .no      { width:150px;}
        .title   { width:50%;  }
        td.title   { text-align: left;  }
        td.writer  { text-align: left;  }
        td.viewcnt { text-align: right; }
        td.title:hover {
            text-decoration: underline;
        }
        .paging {
            color: black;
            width: 100%;
            align-items: center;
        }
        .page {
            color: black;
            padding: 6px;
            margin-right: 10px;
        }
        .paging-active {
            background-color: rgb(216, 216, 216);
            border-radius: 5px;
            color: rgb(24, 24, 24);
        }
        .paging-container {
            width:100%;
            height: 70px;
            display: flex;
            margin-top: 50px;
            margin : auto;
        }
        .btn-write {
            visibility: ${adminShowCheck};
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
            margin-left: 30px;
        }
        .btn-write:hover {
            text-decoration: underline;
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
    if(msg=="LIST_ERR")  alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
    if(msg=="READ_ERR")  alert("삭제되었거나 없는 게시물입니다.");
    if(msg=="DEL_ERR")   alert("삭제되었거나 없는 게시물입니다.");
    if(msg=="DEL_OK")    alert("성공적으로 삭제되었습니다.");
    if(msg=="WRT_OK")    alert("성공적으로 등록되었습니다.");
    if(msg=="MOD_OK")    alert("성공적으로 수정되었습니다.");
</script>
<div style="text-align:center">
    <div class="board-container">
        <div class="empty-container">
            <p></p>
        </div>
        <div class="notice-container">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">공지사항</h5>
                    <p></p>
                    <p class="card-text"> OurStyle의 새로운 소식을 전해드립니다!</p>
                </div>
            </div>
        </div>
        <div class="search-container">
            <form action="<c:url value="/noticeboard/list"/>" class="search-form" method="get">
                <select class="search-option" name="option">
                    <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
                    <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
                    <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
                </select>

                <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
                <input type="submit" class="search-button" value="검색">
            </form>
            <button id="writeBtn" class="btn-write" onclick="location.href='<c:url value="/noticeboard/write"/>'"><i class="fa fa-pencil"></i>글쓰기</button>
        </div>

        <table>
            <tr>
                <th class="no">번호</th>
                <th class="title">제목</th>
                <th class="writer">이름</th>
                <th class="regdate">등록일</th>
                <th class="viewcnt">조회수</th>
            </tr>
            <c:forEach var="boardDto" items="${list}">
                <tr>
                    <td class="no">${boardDto.bno}</td>
                    <td class="title"><div class="ellipis"><a href="<c:url value="/noticeboard/read${ph.sc.queryString}&bno=${boardDto.bno}"/>"><c:out value="${boardDto.title}"/></a></div></td>
                    <td class="writer">${boardDto.writer}</td>
                    <c:choose>
                        <c:when test="${boardDto.reg_date.time >= startOfToday}">
                            <td class="regdate"><fmt:formatDate value="${boardDto.reg_date}" pattern="HH:mm" type="time"/></td>
                        </c:when>
                        <c:otherwise>
                            <td class="regdate"><fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd" type="date"/></td>
                        </c:otherwise>
                    </c:choose>
                    <td class="viewcnt">${boardDto.view_cnt}</td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <div class="paging-container">
            <div class="paging">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div> 게시물이 없습니다. </div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a class="page" href="<c:url value="/noticeboard/read?page=1&pageSize=15&option=&keyword=&bno=49${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/noticeboard/read?page=1&pageSize=15&option=&keyword=&bno=49${ph.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a class="page" href="<c:url value="/noticeboard/read?page=1&pageSize=15&option=&keyword=&bno=49${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
        <p class="col-md-4 mb-0 text-muted">&copy; Copyright By OurStyle.</p>

        <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
        </a>

        <ul class="nav col-md-4 justify-content-end">
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
        </ul>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
</body>
</html>