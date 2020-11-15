<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
</head>
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet" href="${root}/css/board-write.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap"
	rel="stylesheet" />
<body>
	<c:import url="../common/header.jsp"/>

	<!-- banner start -->
	<section class="sections">
		<div class="sections__">
			<div class="text">
				<h1>게시글 작성</h1>
				<span></span>
			</div>
			<div class="textImg"></div>
		</div>
	</section>
	<!-- banner end -->

	<section class="firstSec"></section>
	<!-- Latest Products Start -->
	<section class="latest-product-area latest-padding"
		style="text-align: center">
		<section class="sectionBox">
			<form class="passwordUpdate" action="" method="get">
				<ul class="writeBox">
					<li class="wImg"><a>상품이미지</a>
						<div class="wrap">
							<label class="wrap2"><i
								class="fas fa-camera"></i> <input type="file" class="wImgFile"
								accept="image/*" name="wImage" id="" /> </label> <label
								class="wrap2"> <img src="${root}/img/Jiseong.png" alt="" />
							</label>
						</div></li>
					<li class="wTitle"><a>제목</a>
						<div class="wrap">
							<input type="text" name="wTitle" id="" />
						</div></li>
					<li class="wCate"><a>카테고리</a>
						<div class="wrap">
							<div class="wCate__option">
								<div class="option__1">
									<ul>
										<li><button type="button">남성의류</button></li>
										<li><button type="button">여성의류</button></li>
										<li><button type="button">전자기기</button></li>
										<li><button type="button">생활용품</button></li>
										<li><button type="button">남성의류</button></li>
										<li><button type="button">여성의류</button></li>
										<li><button type="button">전자기기</button></li>
										<li><button type="button">생활용품</button></li>
										<li><button type="button">남성의류</button></li>
										<li><button type="button">여성의류</button></li>
										<li><button type="button">전자기기</button></li>
										<li><button type="button">생활용품</button></li>
									</ul>
								</div>
							</div>
						</div></li>
					<li class="wPlace"><a>거래지역</a>
						<div class="wrap">
							<input type="text" name="" id="" />
						</div></li>
					<li class="wStatus"><a>상태</a>
						<div class="wrap">
							<input type="radio" name="status" id="used" /> <label for="used">중고상품</label>
							<input type="radio" name="status" id="new" /> <label for="new">새상품</label>
						</div></li>
					<li class="wPrice"><a>가격</a>
						<div class="wrap">
							<div class="inputs">
								<div class="inputs__price">
									<input type="text" name="" id="" class="input" />
									<div class="output">
										<div class="out">원</div>
									</div>
								</div>
								<div class="inputs__status">
									<input type="checkbox" name="" id="include" /> <label
										for="include">배송비포함</label> <input type="checkbox" name=""
										id="nego" /> <label for="nego">가격협의 가능</label>
								</div>
							</div>
						</div></li>
					<li class="wEx"><a>설명</a>
						<div class="wrap">
							<textarea name="" id="" cols="30" rows="10"></textarea>
						</div></li>
				</ul>
				<button type="submit">등록하기</button>
			</form>
		</section>
	</section>

	<c:import url="../common/footer.jsp"/>

	<script>
      const inputText = document.querySelector(".input");
      const out = document.querySelector(".out");

      inputText.addEventListener("keyup", (e) => {
        let val = inputText.value;
        if (val[0] == 0) {
          alert("0원 이상의 금액만 입력 가능.");
          return (inputText.value = "");
        }
        // 값을 임시 저장한다.
        let result = "";
        // 최종 값을 반환한다.
        let result2 = "";
        // 길이가 3까지는 그대로 출력
        if (val.length <= 3) {
          out.style.color = "black";
          return (out.textContent = `${'${val}'}` + "원");
        }
        // 길이 4부터는 콤마 입력
        else if (val.length > 3) {
          let str = "";
          for (i = 1; i < val.length; i++) {
            let cut = val.substr(val.length - i, 1);
            str += cut;
            let comma = ",";
            if (i % 3 === 0) {
              str += comma;
            }
            result = str + val[0];
          }
        }
        // result값을 result2에 거꾸로 담는다.
        for (i = 1; i < result.length + 1; i++) {
          let cut2 = result.substr(result.length - i, 1);
          result2 += cut2;
        }
        out.textContent = result2 + "원";

        if (val >= 1000000) {
          out.style.color = "red";
        } else if (val >= 100000) {
          out.style.color = "brown";
        } else if (val >= 50000) {
          out.style.color = "orange";
        } else if (val >= 10000) {
          out.style.color = "green";
        } else if (val <= 10000) {
          out.style.color = "black";
        }
      });
    </script>
</body>
</html>
