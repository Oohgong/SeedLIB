<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/contents.css">
<link rel="stylesheet" href="/css/layout.css">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/sub.css">
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>

</head>
<body>

	<div class="wrap">

<c:import url="../temp/header.jsp"></c:import>


<div id="container" class="sub">
		
<div class="sVisualWrap">
	<div class="sVisual">
		<h3>나의정보</h3>
	</div>
</div>
		<div id="contentGroup">
			
<div id="lnbNav" class="navArea">
	
	<c:import url="../sideBar/FsideBar.jsp"></c:import>

</div>

			<div id="contentcore">
				



<div class="naviandtitle">
	<h3>나의정보</h3>
	<div class="navi"><a href="/intro/index.do" title="홈으로 이동" class="home"><span class="blind">홈</span></a><i class="arrow"></i> 마이페이지 <i class="arrow"></i>나의정보</div>
	<div class="snsFarm">
		<ul class="snsBtnArea clearfix">
			<li>
				<a href="#snsGroup" id="sns" title="SNS 공유하기" class="snsShare"><span class="blind">SNS 공유하기</span></a>
				<div id="snsGroup" class="snsList clearfix">
					<a href="#sns1" id="sns1" title="단축URL 복사하기" class="snsUrl" onclick="fnShorturlCopy();"><span class="blind">단축URL</span></a>
					<a href="#sns2" id="sns2" title="QR코드 레이어팝업 열림" class="snsQr" data-tooltip="chartSns"><span class="blind">QR코드</span></a>
					<a href="#sns3" id="sns3" onclick="javascript:fnShareKakaoStory('https://lib.anyang.go.kr/intro/index.do'); return false;" title="카카오스토리에 공유하기 새창열림" class="snsStory"><span class="blind">카카오스토리</span></a>
					<a href="#sns4" id="sns4" onclick="javascript:fnShareTwitter('https://lib.anyang.go.kr/intro/index.do'); return false;" title="트위터에 공유하기 새창열림" class="snsTwitter"><span class="blind">트위터</span></a>
					<a href="#sns5" id="sns5" onclick="javascript:fnShareFaceBook('https://lib.anyang.go.kr/intro/index.do'); return false;" title="페이스북에 공유하기 새창열림" class="snsFacebook"><span class="blind">페이스북</span></a>
				</div>
			</li>
			<li class="mobileHide"><a href="#print" id="pprint" title="인쇄" class="snsPrint" onclick="javascript:fnPrintPopup('intro'); return false;"><span class="blind">현재화면 프린트</span></a></li>
		</ul>
	</div>
</div>



<script src="/include/js/clipboard.min.js"></script>

				<div id="contents" class="contentArea">
					
<!--Forced tab Show Que-->
<div class="ttabWrap">
	<div id="virtSelect"><a href="#script">탭메뉴</a></div>
	<ul id="ttab3" class="tnb clearfix">
		<li class="ttabLast"></li>
	</ul>
</div>
<!--Forced tab Show Que-->

<div id="popblackBG"></div>
					<!--Real Contents Start-->
					<div class="myPageWrap">
						<div class="clearfix">
							<!-- PC버전 정회원일때 -->
							<div class="myInfoBox">
								<div class="myInner">
									<div class="myTop">
										<div class="title"><strong class="name"> ${vo.name} </strong> 님, 안녕하세요.</div>
										<div class="btnModify">
											
											
												<a href="#" class="btn">온라인회원증발급</a>
											
											<a href="/mypage/memberModify" class="btn white">회원정보수정</a>
										</div>
									</div>
									<div class="myInfo">
										<div class="memType">
											
													<strong class="member typeB">준회원</strong>
												
										</div>
										<div class="myInfoList">
											<ul class="dot-list">
												<li><span>아이디</span> : ${vo.userName} </li>
												<li><span>회원가입일</span> : ${vo.regDate} </li>
												<li><span>휴대폰번호</span> : ${vo.phone} </li>
												
												<!-- <li><span>회원증번호</span> : </li>
												<li class="mobileShow"><span class="emp1">※ 모바일회원증 캡처 이미지 사용 불가</span></li>-->
											</ul>
										</div>
									</div>

									<!-- 가족회원 바코드 -->
									<div class="barcodeWrap mobileShow">
										<div class="swiper-container">
											<ul class="barcodeFamily swiper-wrapper">
												
												<li class="swiper-slide">
													<div class="name"> ${vo.name} </div>
													<img src="https://www.yslibrary.or.kr/cmmn/barcode/getBarCode.do?width=248&amp;height=75&amp;data=" alt="" width="248" height="75">
													<div class="num"></div>
												</li>
												
											</ul>
											<p class="coution">※ 모바일회원증 캡처 이미지 사용불가</p>
											<!-- Add Arrows -->
											<a href="#none" class="btnSlidePrev"></a>
											<a href="#none" class="btnSlideNext"></a>
										</div>
									</div>
									<script>
										$(function () {
											if($(".barcodeWrap .swiper-slide").length > 1) {
												$(".btnSlideNext").css("display", "block");
												$(".btnSlidePrev").css("display", "block");
												var popupSwiper = new Swiper('.barcodeWrap .swiper-container', {
													loop:true,
													observer:true,
													observeParents:true,
													navigation: {
														nextEl: '.barcodeWrap .btnSlideNext',
														prevEl: '.barcodeWrap .btnSlidePrev',
													}
												});
											}
										});
									</script>
									<!-- 가족회원 바코드 -->

								</div>
							</div>

							<h4 class="stitle">서비스 이용현황</h4>
							<ul class="myState clearfix">
							
								<li>
									<a href="/intro/lectureApplyList.do">
										<strong class="tit">신청중인<br>문화행사</strong>
										<span class="num">0</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- End Of the Real Contents-->
				</div>
			</div>
		</div>
	</div>
      <!-- footer -->
	  <c:import url="../temp/footer.jsp"></c:import>
	  <!-- //footer --> 
</div>

</body>
</html>