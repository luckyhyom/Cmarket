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

<style type="text/css">
.text{
	margin:auto;
	color:gray;
}

</style>

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
	<c:import url="../common/header.jsp" />

	<!-- banner start -->
	<section class="sections">
		<div class="sections__">
			<div class="text">
				<h1>상품 등록</h1>
			</div>
		</div>
	</section>
	<!-- banner end -->

	<section class="firstSec"></section>
	<!-- Latest Products Start -->
	<section class="latest-product-area latest-padding"
		style="text-align: center">
		<section class="sectionBox">
			<form action="writePB.do" method="post" enctype="multipart/form-data"
				id="writePBForm">
				<input type="hidden" name="profile_sq"
					value="${memberProfile.profile_sq}">
				<input type="hidden" name="sample4_jibunAddress"
					value="${sessionScope.loginUser.sample4_jibunAddress}">
				<ul class="writeBox">
					<li class="wImg"><a>상품이미지</a>
						<div class="wrap">
							<label class="wrap2"> <i class="fas fa-camera"></i> <input
								type="file" class="wImgFile" accept="image/*" name="imgFile1"
								id="imgFile1"  />
							</label>
							
							<%-- <label class="wrap2"> <i class='fas fa-trash'></i> <img
								src='${root}/board-imgs/${json.fileName}' alt='readyImg' /> <input
								type='hidden' value='${json.fileName}' name='files' /> <input
								type='hidden' value='${json.oriName}' name='oriNames' />
							</label> --%>

						</div></li>



					<li class="wTitle"><a>제목</a>
						<div class="wrap">
							<input type="text" name="board_title" id="board_title" required/>
						</div></li>
					<li class="wCate"><a>카테고리</a>
						<div class="wrap">
							<div class="wCate__option">
								<div class="option__1">
									<ul>
										<select name='cate_name' id="cate_name" style="width: 100%;" required>
											<option value='' selected>-- 선택 --</option>
											<option value='남성의류'>남성의류</option>
											<option value='여성의류'>여성의류</option>
											<option value='전자기기'>전자기기</option>
											<option value='도서'>도서</option>
										</select>
									</ul>
								</div>
							</div>
						</div></li>
					<!-- <li class="wPlace"><a>거래지역</a>
						<div class="wrap">
							<input type="text" name="board_address" id="board_address" />
						</div></li> -->
					<!-- 		<li class="wStatus"><a>상태</a>
						<div class="wrap">
							<input type="radio" name="status" id="used" /> <label for="used">중고상품</label>
							<input type="radio" name="status" id="new" /> <label for="new">새상품</label>
						</div></li> -->
					<li class="wPrice"><a>가격</a>
						<div class="wrap">
							<div class="inputs">
								<div class="inputs__price">
									<input type="text" name="price" id="price" class="input" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" required />
									<div class="output">
										<div class="out">원</div>
									</div>
								</div>
								<div class="inputs__status" style='text-align: start'>
									<!-- <input type="checkbox" name="" id="include" /> <label
										for="include">배송비포함</label> --> <input type="checkbox" name="nego"
										id="nego" value="Y" /> <label for="nego">가격협의 가능</label>
								</div>
							</div>
						</div></li>
					<li class="wEx"><a>설명</a>
						<div class="wrap">
							<textarea name="board_content" id="board_content" cols="30"
								rows="10" required></textarea>
						</div></li>
				</ul>
				<button type="submit" onClick="return inspectFile()">등록하기</button>
			</form>
		</section>
	</section>

	<c:import url="../common/footer.jsp" />

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

      
  	const form = document.querySelector('#writePBForm');
	/* const injectImg = document.querySelector('.injectImg'); */
	const inputFile = document.querySelector('input[name="imgFile1"]');
	const profile_sq = document.querySelector('input[name="profile_sq"]');
	const wrap = document.querySelector('.wrap');
	
	const deleteImg = document.querySelectorAll('.fa-trash');
	
	console.log(inputFile);
	console.log(profile_sq.value);
		/* injectImg.src = `${root}/img/Bill.png`; */

		/* formData.append('profile_sq', profile_sq.value); */
	inputFile.addEventListener('change',()=>{
		const formData = new FormData(form);

		fetch('uploadPBFile.do', {
			  method: 'POST', // POST 메소드 지정
			  body: formData, // formData를 데이터로 설정
			}).then((res) => {
			  if (res.status === 200 || res.status === 201) {
				console.log(res);
			    res.json().then((json) => {
			    							console.log(json.fileName);
			    						    const label = document.createElement('label');
			    						    label.classList.add('wrap2');
			    						    label.innerHTML=
			    						    	`<i class='fas fa-trash'></i>
			    						    	<img src='${root}/board-imgs/${'${json.fileName}'}' alt='readyImg' />
			    						    	<input type='hidden' value='${'${json.fileName}'}' name='files'/>
			    						    	<input type='hidden' value='${'${json.oriName}'}' name='oriNames'/>`;
			    						    wrap.append(label);
			    						});
			  } else {
			    console.error(res.statusText);
			  }
			}).catch(err => console.error(err));
		
		
		setTimeout(() => {
		 
			 	const deleteImg = document.querySelectorAll('.fa-trash');
	            deleteImg.forEach((btn)=>{
	
						btn.addEventListener('click',(e)=>{
	 					console.log('success');
	  
						/* input에 들어있는 파일명 */
						const fileName = btn.nextSibling.nextSibling.nextSibling.nextSibling.value;
		  				console.log(fileName);

		  				console.log(btn.nextSibling.nextSibling.nextSibling.nextSibling.value);
		  				
		  				/* 컨트롤러에서 @RequestBody형식의 객체형태로 받아줘야한다. json은 String이 아닌 객체이다. */
		  				fetch('deletePBFile.do', {
		    			method: 'POST',
		  				body: JSON.stringify({file_name:fileName,}),
		  				headers: new Headers({'Content-Type':'application/json'}),
		  		}).then((res) => {
		    						if (res.status === 200 || res.status === 201) {
		    							res.text().then((json) => {
		      							/* res.json().then((json) => { */
		      								/* String값 받아오는법? */
		                    									console.log(json);
		                  				});
		    						} else {
		      								console.error(res.statusText);
		    						}
		  		}).catch(err => console.error(err));
		  
		      btn.parentElement.remove();
						})
				})
				
		}, 300);
	    
	})
	
	  
      
		function inspectFile(){
			if(document.querySelector('input[name=files]')){
				return true;
			}else{
				alert('제품 이미지를 등록해주세요.');
				return false;
			}
		}
	
	
	
    </script>
</body>
</html>
