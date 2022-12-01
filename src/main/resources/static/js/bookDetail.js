let popupWidth = "750";
let popupHeight = "550";
let popUp = "";
  
// 듀얼 모니터 고려한 윈도우 띄우기
let curX = window.screenLeft;
let curWidth = document.body.clientWidth;
let curHeight = document.body.clientHeight;
  
let nLeft = (screen.availWidth/ 2) - (popupWidth / 2);
let nTop = ((screen.availHeight-popupHeight)/2)-10;

let strOption = "";
strOption += "left=" + nLeft + "px,";
strOption += "top=" + nTop + "px,";
strOption += "width=" + popupWidth + "px,";
strOption += "height=" + popupHeight + "px,";
strOption += "toolbar=no,menubar=no,location=no,";
strOption += "resizable=yes,status=yes";

let isbn = $("#isbn").val();
const userName = $("#userName").val();

//좋아요
$("#likeBtn").click(function(){
	
	$.ajax({
		type : "POST",
		url : "like/add",
		data : {
			isbn : isbn,
			userName : userName
		},
		success : function(){
			location.reload()
		},
		error : function(){
			location.reload()
		}
	})
});
	
//좋아요 취소	
$("#unlikeBtn").click(function(){
	
	$.ajax({
		type : "POST",
		url : "like/delete",
		data : {
			isbn : isbn,
			userName : userName
		},
		success : function(){
			location.reload()
		},
		error : function(){
			location.reload()
		}
	})
});

//-------------------------------------------------
//디테일 페이지에서 책꽂이에 책 저장하기 눌렀을 때
$("#addBookBtn").click(function(){
	$.ajax({
		type : "GET",
		url : "../shelf/addBook",
		data : {
			isbn : isbn,
			userName : userName
		},
		success : function(){
			window.close();
			window.open('../shelf/addBook?isbn='+isbn+'&userName='+userName, "책꽂이에 저장", strOption);
		},
		error : function(){
			window.close();
			console.log("ADD BOOK ERROR");
		}
	})
});

//책꽂이 선택 후 책 저장
$("#RealBookBtn").click(function(){
	const bookPickVO = {
		isbn : $("#isbn").val(),
		shNum : $(".shNum").val(),
	}
	
	console.log(bookPickVO);
	
	$.ajax({
		type : "POST",
		url : "/shelf/addBook",
		data:JSON.stringify(bookPickVO),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success:function(data){
			switch (data){
				case 2:
					alert("해당 책이 이미 책꽂이에 존재합니다.")
					window.close();
					break;
				case 1:
					let check = window.confirm("책꽂이에 책을 저장했습니다.\n마이페이지에서 확인하시겠습니까?");
					if(check){
						opener.location.href="/shelf/bookList";
						window.close();
						break;
					} else{
                        opener.location.href="../"; 
                        window.close();
                        break;
                    } 
				}
			},
			error:function(){
				console.log("ERROR");
			}
		})
	});



//-------------------------------------------------
//새 책꽂이 생성 눌렀을 때
$("#addShelfBtn").click(function(){
	$.ajax({
		type : "GET",
		url : "../shelf/newShelf",
		success : function(){
			window.close();
			window.open('../shelf/newShelf?userName='+userName, "새 책꽂이 생성", strOption);
		},
		error : function(){
			window.close();
			console.log("ADD SHELF ERROR");
		}
	})
});

//새 책꽂이 저장
$("#RealShelfBtn").click(function(){
	const bookShelfVO = {
		shName : $("#shName").val(),
		shMemo : $("#shMemo").val(),
		userName : userName
	}
	
	console.log(bookShelfVO);
	
	$.ajax({
		type : "POST",
		url : "/shelf/newShelf",
		data:JSON.stringify(bookShelfVO),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success:function(data){
			switch (data){
				case 2:
					alert("해당 이름의 책꽂이가 이미 존재합니다.")
					break;
				case 1:
					let check = window.confirm("책꽂이를 생성했습니다.\n마이페이지에서 확인하시겠습니까?");
					if(check){
						opener.location.href="/shelf/list";
						window.close();
						break;
					} else{
                        opener.location.href="../"; 
                        window.close();
                        break;
                    } 
				}
			},
			error:function(){
				console.log("ERROR");
			}
		})
	});
	
//-------------------------------------------------
//로그인 창 띄우기
$("#LoginBtn").click(function(){
	window.open('../, "로그인하기", strOption);
});



	