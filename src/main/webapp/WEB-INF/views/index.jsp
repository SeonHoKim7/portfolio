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
    <title>OurStyle</title>

    <style>
        /* 캐러셀(이미지슬라이드) 이미지 크기변경 */
        .carousel-inner{
            width:auto;
            height:500px; /* 이미지 높이 변경 */
        }
        .carousel-item{
            width: auto;
            height:100%;
        }
        .d-block {
            display:block;
            width: auto;
            height: 100%;
        }

        .wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 40vh;
        }

        .card-img-top {
            height: 15rem;
            object-fit: cover;
        }

        .visible {
            display: none;
        }

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
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
<div>
    <br>
</div>
<div class="container-sm w-75">
    <div style="text-align:center">
        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="https://www.ocokorea.com/shop/goods/event_view.do?bid=4669" target='_blank'>
                        <img src="https://1746b291a6740af9.kinxzone.com/upload/images/editor/202304/1683456501196.jpg.jpg" class="d-block w-100" alt="...">
                    </a>
                </div>
                <div class="carousel-item">
                    <a href="https://www.musinsa.com/app/campaign/index/tshirtsfestival_2023" target='_blank'>
                        <img src="https://image.msscdn.net/images/campaign_img/2023042516531400000005608.jpg" class="d-block w-100" alt="...">
                    </a>
                </div>
                <div class="carousel-item">
                    <a href="https://www.youtube.com/watch?v=-dwuW-aIm4I" target='_blank'>
                        <img src="https://i.ytimg.com/vi/-dwuW-aIm4I/maxresdefault.jpg" class="d-block w-100" alt="...">
                    </a>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <div class="container">
        <div class="container px-10">
            <div class="row gx-5">
                <div class="col-7">
                    <table>
                        <c:forEach var="boardDto" items="${list}" end="4">
                            <tr>
                                <td class="title">
                                    <a href="<c:url value="/${ph.sc.queryString}&bno=${boardDto.bno}"/>"><c:out value="${boardDto.title}"/>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="col-5">
                    <table>
                        <c:forEach var="boardDto" items="${list}" end="4">
                            <tr>
                                <td class="title">
                                    <a href="<c:url value="/${ph.sc.queryString}&bno=${boardDto.bno}"/>"><c:out value="${boardDto.title}"/>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="wrapper">
        <div class="row row-cols-auto">
            <div class="col">
                <div class="card " style="width: 18rem;">
                    <a href="https://oncuration.com/%EA%B5%AC%ED%98%95-%EB%A7%A4%EB%A0%A5%EC%A0%81%EC%9D%B8-%EC%95%84%EC%B9%B4%EC%9D%B4%EB%B8%8C-%ED%8C%A8%EC%85%98-%EB%B8%8C%EB%9E%9C%EB%93%9C/" target='_blank'>
                        <img src="https://oncuration.com/wp-content/uploads/2023/02/%EC%98%AC%EB%93%9C-%EC%85%80%EB%A6%B0-%EB%A1%9C%EA%B3%A0.jpg" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card" style="width: 20rem;">
                    <a href="https://oncuration.com/%EA%B5%AC%ED%98%95-%EB%A7%A4%EB%A0%A5%EC%A0%81%EC%9D%B8-%EC%95%84%EC%B9%B4%EC%9D%B4%EB%B8%8C-%ED%8C%A8%EC%85%98-%EB%B8%8C%EB%9E%9C%EB%93%9C/" target='_blank'>
                        <img src="https://oncuration.com/wp-content/uploads/2023/02/%ED%97%AC%EB%AC%B4%ED%8A%B8%EB%9E%AD-%EC%95%84%EC%B9%B4%EC%9D%B4%EB%B8%8C.jpg" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card" style="width: 20rem;">
                    <a href="https://oncuration.com/%EA%B5%AC%ED%98%95-%EB%A7%A4%EB%A0%A5%EC%A0%81%EC%9D%B8-%EC%95%84%EC%B9%B4%EC%9D%B4%EB%B8%8C-%ED%8C%A8%EC%85%98-%EB%B8%8C%EB%9E%9C%EB%93%9C/" target='_blank'>
                        <img src="https://oncuration.com/wp-content/uploads/2023/02/90%EB%85%84%EB%8C%80-%EB%AF%B8%EC%9A%B0%EB%AF%B8%EC%9A%B0-%EA%B0%80%EB%B0%A9.jpg" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="wrapper">
        <div class="row row-cols-auto">
            <div class="col">
                <div class="card" style="width: 18rem;">

                        <a href="https://oncuration.com/%EA%B5%AC%ED%98%95-%EB%A7%A4%EB%A0%A5%EC%A0%81%EC%9D%B8-%EC%95%84%EC%B9%B4%EC%9D%B4%EB%B8%8C-%ED%8C%A8%EC%85%98-%EB%B8%8C%EB%9E%9C%EB%93%9C/" target='_blank'>
                            <img src="https://oncuration.com/wp-content/uploads/2023/02/%EB%84%98%EB%B2%84%EB%82%98%EC%9D%B8-%EB%AF%B8%ED%82%A4%EB%A7%88%EC%9A%B0%EC%8A%A4.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                        </div>

                </div>
            </div>

            <div class="col">
                <div class="card" style="width: 20rem;">

                        <a href="https://oncuration.com/%EA%B5%AC%ED%98%95-%EB%A7%A4%EB%A0%A5%EC%A0%81%EC%9D%B8-%EC%95%84%EC%B9%B4%EC%9D%B4%EB%B8%8C-%ED%8C%A8%EC%85%98-%EB%B8%8C%EB%9E%9C%EB%93%9C/" target='_blank'>
                            <img src="https://oncuration.com/wp-content/uploads/2023/02/%EC%98%AC%EB%93%9C-%EB%B2%A0%EC%9D%B4%ED%94%84.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                        </div>
                </div>
            </div>

            <div class="col">
                    <div class="card" style="width: 20rem;">
                            <a href="https://oncuration.com/%EA%B5%AC%ED%98%95-%EB%A7%A4%EB%A0%A5%EC%A0%81%EC%9D%B8-%EC%95%84%EC%B9%B4%EC%9D%B4%EB%B8%8C-%ED%8C%A8%EC%85%98-%EB%B8%8C%EB%9E%9C%EB%93%9C/" target='_blank'>
                                <img src="https://oncuration.com/wp-content/uploads/2023/02/%EC%97%90%EB%94%94-%EC%8A%AC%EB%A6%AC%EB%A8%BC-%EB%94%94%EC%98%AC-%EC%98%B4%EB%AF%80.jpg" class="card-img-top" alt="...">
                            </a>
                            <div class="card-body">
                            </div>
                    </div>
            </div>
        </div>
    </div>
    <br>
    <div class="wrapper">
        <div class="row row-cols-auto">
            <div class="col">
                <div class="card" style="width: 18rem;">
                    <a href="https://oncuration.com/%EA%B5%AC%ED%98%95-%EB%A7%A4%EB%A0%A5%EC%A0%81%EC%9D%B8-%EC%95%84%EC%B9%B4%EC%9D%B4%EB%B8%8C-%ED%8C%A8%EC%85%98-%EB%B8%8C%EB%9E%9C%EB%93%9C/" target='_blank'>
                        <img src="https://oncuration.com/wp-content/uploads/2023/02/%EB%A7%88%EB%A5%B4%EC%A7%80%EC%97%98%EB%9D%BC-%EC%95%84%EC%B9%B4%EC%9D%B4%EB%B8%8C.jpg" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card" style="width: 20rem;">
                    <a href="https://oncuration.com/%EA%B5%AC%ED%98%95-%EB%A7%A4%EB%A0%A5%EC%A0%81%EC%9D%B8-%EC%95%84%EC%B9%B4%EC%9D%B4%EB%B8%8C-%ED%8C%A8%EC%85%98-%EB%B8%8C%EB%9E%9C%EB%93%9C/" target='_blank'>
                        <img src="https://oncuration.com/wp-content/uploads/2023/02/%EB%B9%84%EB%B9%84%EC%95%88-%EC%9B%A8%EC%8A%A4%ED%8A%B8%EC%9A%B0%EB%93%9C-%EB%AF%B8%ED%82%A4-%EB%A7%88%EC%9A%B0%EC%8A%A4.jpg" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card" style="width: 20rem;">
                    <a href="https://oncuration.com/%EA%B5%AC%ED%98%95-%EB%A7%A4%EB%A0%A5%EC%A0%81%EC%9D%B8-%EC%95%84%EC%B9%B4%EC%9D%B4%EB%B8%8C-%ED%8C%A8%EC%85%98-%EB%B8%8C%EB%9E%9C%EB%93%9C/" target='_blank'>
                        <img src="https://oncuration.com/wp-content/uploads/2023/02/%EC%A7%88-%EC%83%8C%EB%8D%94-%EC%95%84%EC%B9%B4%EC%9D%B4%EB%B8%8C.jpeg" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                    </div>
                </div>
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