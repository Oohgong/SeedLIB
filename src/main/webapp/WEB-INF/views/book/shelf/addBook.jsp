<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/board.css">
    <link rel="stylesheet" href="/css/button.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/sub.css">
    
    <script type="text/javascript" defer src="/js/common.js"></script>
    
	<title>책꽂이 : 씨앗도서관 ☘️ </title>
</head>

<body>

	<div id="divWrapper">
		<section id="divContents">
			<div class="sub-title cf box">
				<h2 id="divTitle" class="fl">책꽂이</h2>
			     <!--  브레드크럼 시작  -->
				<div class="breadCrumb fr">
					<ul>	
						<li class="home"><span></span></li>
						<li><a href="/myloan/list">내서재</a></li><li class="currentPage">책꽂이</li>
					</ul>
			    </div>
				<!--  브레드크럼 종료  -->
			</div>
			
			<div id="divContent">
				<form name="form" action="/mylist/insertitem" method="post">
		
				<input type="hidden" name="item" value="CAT000001370034">	
				<input type="hidden" name="detailUrl" value="/search/detail/CATTOT000001370034?briefLink=/main/searchBrief?st=KWRD_A_si=TOTAL_A_q=%EC%A0%9C%EC%9D%B8%EC%97%90%EC%96%B4">
				
				<div class="writeTable">
					<table>
						<caption>책꽂이 저장</caption>
					
						<tbody>
							<tr>
								<th><label for="list_id">담을 곳</label></th>
								<td>
									<select id="list_id" name="list_id" class="selectBox1">
										<option value="51608">ㅎ</option>
										<option value="0">새로운 서재</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="buttons">
					<input type="submit" value="저장" title="저장" alt="저장">
					<a href="javascript:window.close();" title="저장">닫기</a>
				</div>
				</form>
			</div>
		</section>
	</div>
</body>
</html>