<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>myInfo</title>
</head>
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap"
	rel="stylesheet" />
<%-- <link rel="stylesheet" href="${root}/css/chatApply.css" /> --%>
<link rel="stylesheet" href="${root}/css/userProfile.css" />
<link rel="stylesheet" href="${root}/css/myInfo.css" />
<body>
	<c:import url="../common/header.jsp" />
	<c:url value="viewProfile.do" var="viewProfile">
		<c:param name="user_sq" value="1"/>
	</c:url>
	<a href="${viewProfile}">클릭클릭클</a> <!-- 게시판은 어떻게 링크 달더라? -->
	
	<section class="profileSections">
		<div class="profileSections__">
			<div class="profileTop">
				<div class="profileImg">
					<form action="profileFileUpload.do" method="post"
						enctype="multipart/form-data" id="profileForm">
						<input type="hidden" name="profile_sq"
							value="${memberProfile.profile_sq}"> <input type="file"
							name="profileFile" id="profileFile" style="display: none;"
							accept="image/*"> <label for="profileFile"><img
							class="injectImg"
							src='${root}/profilePhotos/${memberProfile.profile_photo }'
							alt="" /></label>
					</form>
				</div>

				<div class="topRight">
					<div class="profileName">${memberProfile.profile_nickname}</div>
					<!-- <button class="toUpdate">내 정보 수정</button> -->
					<div class="profileTopBtn">
						<button>
							<a class="toUpdate" href="myInfoUpdateForm.do">내 정보 수정</a>
						</button>
						<!-- <button>대화하기</button>
              <button>칭찬</button>
              <button>비매너</button> -->
						<!-- <button><a href="">매너평가하기</a></button> -->
					</div>
				</div>
				<!-- <ul class="judge">
            <div class="judgeGood">칭찬</div>
            <div class="judgeBad">비매너</div>
          </ul> -->
			</div>
			<div class="profileTemp">
				<div class="tempCount">매너온도
					${memberProfile.profile_temperature}C🥰</div>
				<div class="temp">
					<div class="temp__"
						style="width:${memberProfile.profile_temperature}%"></div>
				</div>
			</div>
			<div class="sellList">
				<button>
					<a href="sellList.do">판매내역</a>
				</button>
				<button>
					<a href="sellList.do">구매내역</a>
				</button>
				<button>
					<a href="sellList.do">관심목록</a>
				</button>
				<button>
					<a href="sellList.do">모아보기</a>
				</button>
				<div class="keywords">
					<div class="keywordInputs">
						<input type="text" class="keywordInput"></input>
						<button class="keywordBtn" style="width: 100px;">키워드 추가</button>
					</div>

					<ul class="keywordList">
						<li class="keyword">나이키<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
						<li class="keyword">아디다스<i class="fas fa-times"></i></li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<c:import url="../common/footer.jsp" />

	<script type="text/javascript">
	const profileForm = document.querySelector('#profileForm');
	const injectImg = document.querySelector('.injectImg');
	const inputFile = document.querySelector('input[name="profileFile"]');
	const profile_sq = document.querySelector('input[name="profile_sq"]');
	console.log(inputFile);
	console.log(profileForm);
	console.log(profile_sq.value);
		/* injectImg.src = `${root}/img/Bill.png`; */

		/* formData.append('profile_sq', profile_sq.value); */
	inputFile.addEventListener('change',()=>{
		const formData = new FormData(profileForm);
		/* const formData = new FormData(profileForm);
		formData.append('profile_sq', profile_sq.value); */
		/* console.log(formData.get('profile_sq')); */
		fetch('profileFileUpload.do', {
			  method: 'POST', // POST 메소드 지정
			  body: formData, // formData를 데이터로 설정
			}).then((res) => {
			  if (res.status === 200 || res.status === 201) {
				console.log(res);
			    res.json().then((json) => {console.log(json.fileName);
			    
			    /* injectImg.src = `${root}/profilePhotos/json.fileName`; */
			    
			    fetch('updateProfilePhoto.do', {
					  method: 'POST', // POST 메소드 지정
					  body: JSON.stringify({profile_sq:${memberProfile.profile_sq},
						  profile_photo:json.fileName,
						  /* user_sq:${memberProfile.user_sq},
						  profile_nickname:`${memberProfile.profile_nickname}`,
						  profile_gender:`${memberProfile.profile_gender}`,
						  profile_temperature:${memberProfile.profile_temperature}, */
						  /* profile_date:`${memberProfile.profile_date}` */
	
					  }), // formData를 데이터로 설정
					  headers: new Headers({'Content-Type':'application/json'}),
					}).then((res) => {
					  if (res.status === 200 || res.status === 201) {
					    res.json().then(json => 
					    console.log(`${'${json.fileName}'}`)
					    );
					  } else {
					    console.error(res.statusText);
					  }
					}).catch(err => console.error(err));	
			    
			    injectImg.src = `${root}/profilePhotos/${'${json.fileName}'}`;
			    
			    });
			  } else {
			    console.error(res.statusText);
			  }
			}).catch(err => console.error(err));	
	})
	
			/* const body = {profile_sq:profile_sq.value}; */
/* 		fetch('profileFileUpload.do', {
			  method: 'POST', // POST 메소드 지정
			  body: JSON.stringify({profile_sq:profile_sq.value}), // formData를 데이터로 설정
			  headers: new Headers({'Content-Type':'application/json'}),
			}).then((res) => {
			  if (res.status === 200 || res.status === 201) {
			    res.json().then(json => 
			    console.log(`${'${json.fileName}'}`)
			    );
			  } else {
			    console.error(res.statusText);
			  }
			}).catch(err => console.error(err));	
	}) */
	$(function(){
		getReplyList();
		
		setInterval(function(){
			getReplyList(); // 타 회원이 댓글을 작성했을수도 있으니 지속적으로 댓글 불러오기
		},3000);
		
	
	function getReplyList(){
		var bId = ${b.bId}
		/* 서버관련된걸 js, 혹은 페이지에서 직접 처리하는게 신기하네, 이게 비동기구나 (원래 그랬나? 뭔가 다른 느낌인데 뭐지) */
		$.ajax({
			url:"rList.do",
			data:{bId:bId},
			dataType:"json",
			success:function(data){
				/* console.log(data); */
				$tableBody = $("#rtb tbody");
				$tableBody.html("");
				
				var $tr;
				var $rWriter;
				var $rContent;
				var $rCreateDate;
				
				$("#rCount").text("댓글("+data.length+")");
				
				if(data.length>0){
					for(var i in data){
						$tr = $("<tr>");
						$rWriter = $("<td width='100'>").text(data[i].rWriter);
						$rContent = $("<td>").text(data[i].rContent);
						$rCreateDate = $("<td width='100'>").text(data[i].rCreateDate);
						
						$tr.append($rWriter);
						$tr.append($rContent);
						$tr.append($rCreateDate);
						$tableBody.append($tr);
					}
				}else{// no reply
					$tr = $("<tr>");
					$rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
					
					$tr.append($rContent);
					$tableBody.append($tr);
				}
				
			},error:function(request,status,errorData){
				console.log(request.status+" : " + errorData);
			}
		})
	}
	</script>
</body>
</html>
