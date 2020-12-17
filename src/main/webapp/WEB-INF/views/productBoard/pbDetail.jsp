<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>boardDetail</title>

</head>
<link rel="stylesheet" href="${root}/css/main.css" />
<link rel="stylesheet" href="${root}/css/board-write.css" />
<link rel="stylesheet" href="${root}/css/boardDetail.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous" />
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap"
	rel="stylesheet" />
<script src="${root }/js/boardDetail.js" defer></script>
<body>
	<c:import url="../common/header.jsp"/>
	<section class="boardDetail">
		<div class="boardDetail__">
			<ul class="boardImgs">
				<i class="fas fa-angle-left left"></i>
				<i class="fas fa-angle-right right"></i>
				<ul class="imgList">
					<c:forEach items="${files}" var="f">
						<li class="boardImg">
						<img src="${root}/board-imgs/${f.file_name}"alt="" />
						</li>	
					</c:forEach>
				</ul>
			</ul>
			<div class="boardUserInfo">
				<div class="userInfo">
					<img src="${root}/profilePhotos/${writer.profile_photo}" alt="" />
					<div class="userInfo__">
						<div class="userInfo__name">
							<c:url value="viewProfile.do" var="viewProfile">
								<c:param name="profile_sq" value="${ b.profile_sq }"/>
							</c:url>
							<a href="${viewProfile}">${b.board_writer }</a>
						</div>
						<div class="userInfo__address">${b.board_address}</div>
					</div>
				</div>
				<div class="userRating">
					<div class="temp">
						<c:if test="${ writer.profile_temperature >= 70 }">
						<div class="tempCount">
							<div class="tempInt" style="color:red">${writer.profile_temperature }'C</div>
							<div class="tempGraph">
								<div class="tempGraph__gage" style="width:${writer.profile_temperature }%; background-color:red"></div>
							</div>
						</div>
						<div class="tempImg"><i class="far fa-grin-hearts"style="color:red"></i></div>
						</c:if>
						<c:if test="${ writer.profile_temperature < 70 && writer.profile_temperature >= 52}">
						<div class="tempCount">
							<div class="tempInt" style="color:pink">${writer.profile_temperature }'C</div>
							<div class="tempGraph">
								<div class="tempGraph__gage" style="width:${writer.profile_temperature }%; background-color:pink"></div>
							</div>
						</div>
						<div class="tempImg"><i class="far fa-grin-squint"style="color:pink"></i></div>
						</c:if>
						<c:if test="${ writer.profile_temperature < 52 && writer.profile_temperature >= 42}">
						<div class="tempCount">
							<div class="tempInt" style="color:orange">${writer.profile_temperature }'C</div>
							<div class="tempGraph">
								<div class="tempGraph__gage" style="width:${writer.profile_temperature }%; background-color:orange"></div>
							</div>
						</div>
						<div class="tempImg"><i class="far fa-grin-wink"style="color:orange"></i></div>
						</c:if>
						<c:if test="${ writer.profile_temperature < 42 && writer.profile_temperature >= 31}">
						<div class="tempCount">
							<div class="tempInt" style="color:green">${writer.profile_temperature }'C</div>
							<div class="tempGraph">
								<div class="tempGraph__gage" style="width:${writer.profile_temperature }%; background-color:green"></div>
							</div>
						</div>
						<div class="tempImg"><i class="far fa-smile"style="color:green"></i></div>
						</c:if>
						<c:if test="${ writer.profile_temperature < 31 && writer.profile_temperature >= 10}">
						<div class="tempCount">
							<div class="tempInt" style="color:blue">${writer.profile_temperature }'C</div>
							<div class="tempGraph">
								<div class="tempGraph__gage" style="width:${writer.profile_temperature }%; background-color:blue"></div>
							</div>
						</div>
						<div class="tempImg"><i class="far fa-frown-open"style="color:blue"></i></div>
						</c:if>
						<c:if test="${ writer.profile_temperature < 10 }">
						<div class="tempCount">
							<div class="tempInt" style="color:black">${writer.profile_temperature }'C</div>
							<div class="tempGraph">
								<div class="tempGraph__gage" style="width:90%; background-color:black"></div>
							</div>
						</div>
						<div class="tempImg"><i class="fas fa-poop"style="color:black"></i></div>
						</c:if>
						
						
					</div>
					<span>매너온도</span>
				</div>
			</div>
			<div class="boardContent">
				<h2>${b.board_title }</h2>
				<div class="btns">
					<c:if test="${sessionScope.loginUser ne null}">
							<a href="toPbWrite.do" style="color:slategray">글쓰기</a>
					</c:if>
					<c:if test="${memberProfile.profile_sq eq writer.profile_sq}">
						<a href="updatePB.do" style="color:slategray">수정</a>
					</c:if>
					<c:if test="${memberProfile.profile_sq eq writer.profile_sq}">
						<c:url value="deletePB.do" var="deletePB">
							<c:param name="board_sq" value="${b.board_sq}" />
						</c:url>
						<a href="${deletePB }" style="color:slategray" onClick="return checkDelete()">삭제</a>
					</c:if>
					<!-- <button>목록</button> -->
				</div>
				<span class="boardCate">${b.board_category} ∙ <span class="boardDate">${b.board_date }</span></span>
				<span class="boardPrice">${b.price }</span>
				<div class="boardContent__">
					${c.board_content }
				</div>
				<div class="boardInfo">
					채팅 ${b.board_chat_cnt } ∙ 
					<c:if test="${d eq null}"><input type="checkbox" id="heart"/></c:if>
					<c:if test="${d ne null}"><input type="checkbox" id="heart" checked /></c:if>
					 <label for="heart"
						class="fas fa-heart dips" id="dips"></label> 관심 <span class="dipsCount">${b.board_dips_cnt}</span> ∙ 조회 ${b.board_views_cnt } <c:if test="${b.nego eq 'Y'}"> <span style="color:green;">가격협의</span><i class="far fa-check-circle" style="color:green;"></i> </c:if>
				</div>
			</div>
		</div>
	</section>

	<section class="boardList">
		<ul class="boardList__">
			<h1>이 상품과 함께 봤어요</h1>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/note9.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>갤럭시 노트 9 퍼플 128G</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">200,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>

			<!-- 복사 -->
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/samsungMonitor.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>삼성 모니터 판매합니다.</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">320,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/korunbike.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>코룬 하이브리드 자전거</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">130,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/bans.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>반스 올드스쿨 230</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">20,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/princess.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>왕자 2단선반 이동식행거</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">30,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/cat.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>5단 철제 수납 팝니다</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">32,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
		</ul>
	</section>

	<section class="boardList">
		<ul class="boardList__">
			<h1>인기 중고</h1>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/ikea10000.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>침대협탁(이케아) 팝니다</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">17,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>

			<!-- 복사 -->
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Bill.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>구운계란</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">3,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/Faker.png" alt="" />
				</div>
				<div class="boardInfo">
					<h1>이동식 선반/틈새선반</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">31,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/dretec.jpeg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>전자저울 drectec</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">10,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/sofarTable.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>쇼파 사이드 테이블</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">5,000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
			<li class="board">
				<div class="titleImg">
					<img src="${root}/img/bokgun.jpg" alt="" />
				</div>
				<div class="boardInfo">
					<h1>복근 운동기구</h1>
					<span>서울 관악구 신림동</span>
					<div class="worth">
						<span class="price">1,1000원</span> <span class="likes"><i
							class="far fa-heart"></i></span>
					</div>
				</div>
			</li>
		</ul>
	</section>

	<c:import url="../common/footer.jsp"/>
	
	<script>

    
    const boardDate = document.querySelectorAll('.boardDate');
    const today = new Date();
    console.log(today);  
    boardDate.forEach(
  		  date => {
  			  console.log(date.innerHTML);
  			  date.innerHTML = timeForToday(date.innerHTML);
  			  console.log(date.innerHTML);
  		    /* time.innerHTML = timeForToday('Fri Dec 04 2020 18:09:59 GMT+0900'); */
  		  }
  		);
    
    
    function timeForToday(value) {
      const today = new Date();
      const timeValue = new Date(value);
		timeValue.setHours(timeValue.getHours()+9);
		/* 현재 시간에서 등록시간을 뺀 후에, 1000을 나누면 초가 되고, 초를 60으로 나누면 분이 된다. */
      const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
      if (betweenTime < 1) return '방금전';
      if (betweenTime < 60) {
          return `${'${betweenTime}'}분전`;
      }

      const betweenTimeHour = Math.floor(betweenTime / 60);
      if (betweenTimeHour < 24) {
          return `${'${betweenTimeHour}'}시간전`;
      }

      const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
      if (betweenTimeDay < 365) {
          return `${'${betweenTimeDay}'}일전`;
      }

      return `${'${Math.floor(betweenTimeDay / 365)}'}년전`;
}
    
    
    
    const inputText = document.querySelector(".boardPrice");
    
    (function comma(){
    	
    	let val = inputText.innerHTML;

    	console.log(inputText+'asd');
        // 값을 임시 저장한다.
        let result = "";
        // 최종 값을 반환한다.
        let result2 = "";

        if (val.length <= 3) {
        	inputText.style.color = "black";
          return (inputText.textContent = `${'${val}'}` + "원");
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
        inputText.textContent = result2 + "원";
    })();
      
    
    const dipsBtn = document.querySelector('.dips');
/*     var dipsCount2 = document.querySelector('.dipsCount');
     dipsBtn.addEventListener('click',()=>{
    	fetch('dips.do',{
    		method:'POST',
    		body: JSON.stringify({
    								board_sq:${b.board_sq},
    								profile_sq:${memberProfile.profile_sq},
    				}), 
			headers: new Headers({'Content-Type':'application/json'}),
    	}).then((res) => {
    		
    		
			if (res.status === 200 || res.status === 201) {
				res.text().then((json) => {
					
				    
				    console.log(dipsCount2);
				    dipsCount2.innerHTML = ${b.board_dips_cnt}; 
				    /* 왠지 모르겠지만 공백 페이지가 뜬다. 그래서 일단 새로고침으로 해결해줬다. */
				    /* location.reload(true); */
  			/*	});
			} else {
						console.error(res.statusText);
			}
			
			return false;
			
}).catch(err => console.error(err));

btn.parentElement.remove();
})  */
    
     $('#dips').on("click",function(){

				var board_sq = ${b.board_sq};
				var profile_sq = ${memberProfile.profile_sq};

				$.ajax({
					url:"dips.do",
					data:JSON.stringify({
						board_sq:board_sq,
						profile_sq:profile_sq
					}),
					dataType:'text',
					type:"post",
					headers: {
					        'Content-Type':'application/json'
					},
					success:function(data){
							  const dipsCount = document.querySelector('.dipsCount');
							  console.log(dipsCount);
							  dipsCount.innerHTML = data;
							  console.log(data);
					}, error:function(request,status,errorData){
						console.log(request.status+" : " + errorData);
					}
				})
				
			}) 

			function checkDelete(){
    	 		if(confirm('정말 삭제하시겠어요?')){
    	 			return true;
    	 		}else {
    	 			return false;
    	 		}
     		}
	</script>
</body>
</html>
