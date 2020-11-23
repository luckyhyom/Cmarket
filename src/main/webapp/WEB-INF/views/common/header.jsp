<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources" var="root" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/chatApply.css" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>

	<c:if test="${ empty sessionScope.loginUser }">
		<nav>

			<div class="nav">
				<div class="navR">
					<div class="logo">
						<img src="${root}/img/LOGO.png" alt="cucumber logo" />
					</div>
					<div class="searchBar">
						<input type="search" class="searchText" placeholder="물품명을 검색해보세요!" />
						<i class="fas fa-search"></i>
					</div>
				</div>
				<div class="login">
					<a href="loginForm.do" style="width: 66px">Login</a> <a href="#"
						style="width: 154px"> <i class="fab fa-apple"></i> App Store
					</a>
				</div>
			</div>
		</nav>
	</c:if>
	<c:if test="${ !empty sessionScope.loginUser }">
		<nav>
			<div class="nav">
				<div class="navR">
					<div class="logo">
						<a href="home.do"><img src="${root}/img/LOGO.png"
							alt="cucumber logo" /></a>
					</div>
					<div class="searchBar">
						<input type="search" class="searchText" placeholder="물품명을 검색해보세요!" />
						<i class="fas fa-search"></i>
					</div>
				</div>

				<div class="navRight">
					<div class="toggleBtns">
						<!-- chatListToggle Btn -->
						<div class="chatListToggle">
							<i class="fab fa-facebook-messenger"></i>
						</div>
						<!-- alarmToggle Btn -->
						<div class="alarmToggle">
							<i class="fas fa-bell"></i>
						</div>
					</div>
					<div class="login">
						<a href="pbWrite.do" style="width: 45px;">Write</a> <a
							href="myInfo.do" style="width: 66px">my Info</a>
					</div>
					<a href="logout.do" style="width: 30px;" class="logoutBtn">Logout</a>
				</div>
			</div>
		</nav>

		<!-- chat start -->

		<div class="alarmList">
			<div class="chatList__Text">Alarm</div>
			<div class="chatList__View">
				<div class="alarmList__alarm">어디다스 운동화 팝니다.</div>
				<div class="alarmList__alarm">"김효민"님이 "MIKTEK CV4 [마이크텍 멀티패턴
					진공관 마이크]"를 찜했어요.</div>
				<div class="alarmList__alarm">"박효신"님이 "MIKTEK CV4 [마이크텍 멀티패턴
					진공관 마이크]"를 찜했어요.</div>
				<div class="alarmList__alarm">"빌게이츠"님이 "MIKTEK CV4 [마이크텍 멀티패턴
					진공관 마이크]"를 찜했어요.</div>
				<div class="alarmList__alarm">"백예린"님이 "MIKTEK CV4 [마이크텍 멀티패턴
					진공관 마이크]"를 찜했어요.</div>
				<div class="alarmList__alarm">푸들 운동화 팝니다.</div>
				<div class="alarmList__alarm">조나단 운동화 팝니다.</div>
				<div class="alarmList__alarm">"みさき"님이 "MIKTEK CV4 [마이크텍 멀티패턴
					진공관 마이크]"를 찜했어요.</div>
				<div class="alarmList__alarm">"아이유"님이 "MIKTEK CV4 [마이크텍 멀티패턴
					진공관 마이크]"를 찜했어요.</div>
				<div class="alarmList__alarm">요트 팝니다.(새거)</div>
				<div class="alarmList__alarm">아이스크림 팝니다.(중고)</div>
				<div class="alarmList__alarm">한번 쓴 종이컵 팔아요.</div>
				<div class="alarmList__alarm">"김범수"님이 "MIKTEK CV4 [마이크텍 멀티패턴
					진공관 마이크]"를 찜했어요.</div>
			</div>
		</div>

		<!-- chatList Window -->
		<div class="chatList">
			<div class="chatList__Text">Message</div>
			<div class="chatList__View">
				<!-- Chat User Start -->
				<div class="chatList__User">
					<img class="chatUserImg" src="${root}/img/client_1.png" />
					<div class="chatUserName">"${ sessionScope.loginUser.user_name }"</div>
					<div class="chatIcon chatListUserBtn">
						<i class="fas fa-ellipsis-h"></i>
					</div>

					<div class="chatListUserOption">
						<button>삭제</button>
						<button>차단</button>
					</div>
				</div>
				<!-- Chat User End -->
				<!-- Chat User Duplication Start -->
				<div class="chatList__User">
					<img class="chatUserImg" src="${root}/img/Bill.png" />
					<div class="chatUserName">billgates</div>
					<div class="chatIcon chatListUserBtn">
						<i class="fas fa-ellipsis-h"></i>
					</div>

					<div class="chatListUserOption asdf">
						<button>삭제</button>
						<button>차단</button>
					</div>
				</div>
				<div class="chatList__User">
					<img class="chatUserImg" src="${root}/img/Misaki.jpg" />
					<div class="chatUserName">みさき</div>
					<div class="chatIcon chatListUserBtn">
						<i class="fas fa-ellipsis-h"></i>
					</div>

					<div class="chatListUserOption">
						<button>삭제</button>
						<button>차단</button>
					</div>
				</div>
				<div class="chatList__User">
					<img class="chatUserImg" src="${root}/img/client.png" />
					<div class="chatUserName">Eddy</div>
					<div class="chatIcon chatListUserBtn">
						<i class="fas fa-ellipsis-h"></i>
					</div>

					<div class="chatListUserOption">
						<button>삭제</button>
						<button>차단</button>
					</div>
				</div>
				<div class="chatList__User">
					<img class="chatUserImg" src="${root}/img/searon.png" />
					<div class="chatUserName">김새론</div>
					<div class="chatIcon chatListUserBtn">
						<i class="fas fa-ellipsis-h"></i>
					</div>

					<div class="chatListUserOption">
						<button>삭제</button>
						<button>차단</button>
					</div>
				</div>
				<div class="chatList__User">
					<img class="chatUserImg" src="${root}/img/Hyoshin.png" />
					<div class="chatUserName">박효신</div>
					<div class="chatIcon chatListUserBtn">
						<i class="fas fa-ellipsis-h"></i>
					</div>

					<div class="chatListUserOption">
						<button>삭제</button>
						<button>차단</button>
					</div>
				</div>
				<div class="chatList__User">
					<img class="chatUserImg" src="${root}/img/Faker.png" />
					<div class="chatUserName">이상혁</div>
					<div class="chatIcon chatListUserBtn">
						<i class="fas fa-ellipsis-h"></i>
					</div>

					<div class="chatListUserOption">
						<button>삭제</button>
						<button>차단</button>
					</div>
				</div>
				<div class="chatList__User">
					<img class="chatUserImg" src="${root}/img/Jiseong.png" />
					<div class="chatUserName">박지성</div>
					<div class="chatIcon chatListUserBtn">
						<i class="fas fa-ellipsis-h"></i>
					</div>

					<div class="chatListUserOption">
						<button>삭제</button>
						<button>차단</button>
					</div>
				</div>
				<div class="chatList__User">
					<img class="chatUserImg" src="${root}/img/Beomsu.png" />
					<div class="chatUserName">김범수</div>
					<div class="chatIcon chatListUserBtn">
						<i class="fas fa-ellipsis-h"></i>
					</div>

					<div class="chatListUserOption">
						<button>삭제</button>
						<button>차단</button>
					</div>
				</div>
				<!-- Chat User Duplication End -->

			</div>
		</div>
		<!-- Chat List end -->


		<div class="chat">
			<i class="fas fa-user-friends"></i>
		</div>
		<div class="chatBox" style="text-align: left">
			<div class="chatHead">
				<div class="chatHead__left">
					<img class="chatUserImg" src="${root}/img/client_1.png" />
					<div class="chatUserName">김말똥이</div>
					<div class="chatIcon friendsMenuBtn">
						<i class="fas fa-angle-down"></i>
					</div>
				</div>

				<div class="chatHead__right">
					<div class="chatIcon">
						<i class="fas fa-video"></i>
					</div>
					<div class="chatIcon">
						<i class="fas fa-phone-alt"></i>
					</div>
					<div class="chatIcon">
						<i class="fas fa-minus"></i>
					</div>
					<div class="chatIcon chatClose">
						<i class="fas fa-times"></i>
					</div>
				</div>

			</div>
			<!-- <div
        aria-describedby="placeholder-aqhg5"
        class="notranslate _5rpu"
        contenteditable="true"
        role="textbox"
        spellcheck="true"
        tabindex="0"
        style="
          outline: none;
          user-select: text;
          white-space: pre-wrap;
          overflow-wrap: break-word;
        "
      ></div> -->
			<div class="chatBody">
				<div class="msgBox">
					<!-- 친구 메시지 -->
					<div class="msg">
						<img class="chatUserImg" src="${root}/img/client_1.png"></img>
						<div class="textBox">
							<div class="textBox__row">
								<span class="msgText" style="">안녕하세요 ㅎㅎ</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 나의 메시지 -->
					<div class="myMsg">
						<div class="textBox">
							<div class="textBox__row">
								<span class="msgText" style="">안녕하세요 ㅎㅎ</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 친구 메시지 -->
					<div class="msg">
						<img class="chatUserImg" src="${root}/img/client_1.png"></img>
						<div class="textBox">
							<div class="textBox__row">
								<span class="msgText" style="">はじめまして : )</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 나의 메시지 -->
					<div class="myMsg">
						<div class="textBox">
							<div class="textBox__row">
								<span class="msgText" style="">저는 일본어를 할줄 몰라요</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 친구 메시지 -->
					<div class="msg">
						<img class="chatUserImg" src="${root}/img/client_1.png"></img>
						<div class="textBox">
							<div class="textBox__row">
								<span class="msgText" style="">아~ 죄송합니다 !</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 나의 메시지 -->
					<div class="myMsg">
						<div class="textBox">
							<div class="textBox__row">
								<span class="msgText" style="">괜찮아요</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
							<div class="textBox__row">
								<span class="msgText" style="">생긴건 아메리칸인데 일본어를 쓰시네요</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
							<div class="textBox__row">
								<span class="msgText" style="">어떤 일로 연락하셨나요?</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 친구 메시지 -->
					<div class="msg">
						<img class="chatUserImg" src="${root}/img/client_1.png"></img>
						<div class="textBox">
							<div class="textBox__row">
								<span class="msgText" style="">아 혹시 요트 아직 있나요?</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
							<div class="textBox__row">
								<span class="msgText" style="">제가 일본을 자주 다니는데 비행기 타는게
									귀찮아서요</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
							<div class="textBox__row">
								<span class="msgText" style="">택배 거래 되나요?</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 나의 메시지 -->
					<div class="myMsg">
						<div class="textBox">
							<div class="textBox__row">
								<span class="msgText" style="">오호라</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
							<div class="textBox__row">
								<span class="msgText" style="">차단할게요</span>
								<div class="msg__menu">
									<div class="chatIcon">
										<i class="far fa-smile"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-share"></i>
									</div>
									<div class="chatIcon">
										<i class="fas fa-ellipsis-v"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="chatBottom">
					<div class="chatIcon">
						<i class="fas fa-plus-circle"></i>
					</div>
					<div class="chatIcon">
						<i class="fas fa-images"></i>
					</div>
					<div class="chatIcon">
						<i class="fas fa-paperclip"></i>
					</div>

					<textarea
						style="bottom: 1px; outline: none; width: 200px; height: 28px; padding: 0px; resize: none; margin: 0px; margin-top: 4px; border: 1px solid #f5f5f5; font-size: 14px; line-height: 2; border-radius: 24px; background-color: #f5f5f5; text-indent: 5%; white-space: nowrap; overflow-x: hidden; margin-bottom: 6px;"></textarea>
					<div class="chatIcon">
						<i class="fas fa-smile"></i>
					</div>
					<div class="chatIcon">
						<i class="fas fa-thumbs-up"></i>
					</div>
				</div>
			</div>
		</div>


		<!-- 유저 메뉴 -->
		<div class="chatBox2" style="text-align: left">
			<div class="friendUserMenu">
				<div class="friendProfile">
					<i class="far fa-user-circle"></i>
					<div class="friendProfileText">프로필 보기</div>
				</div>
				<div class="friendDelete">
					<i class="fas fa-user-alt-slash"></i>
					<div class="friendDeleteText">차단</div>
				</div>
			</div>
		</div>
		<script src="${root}/js/chatToggle.js"></script>
		<!-- chat end -->

	</c:if>
</body>
</html>