window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});


const pw = document.getElementById("inputPassword");
const pw_cf = document.getElementById("inputPasswordConfirm");
// 아이디 입력시 영문자 특수문자 1개 이상 포함

function handleResponse(response) {
     if (response === true) {
       Swal.fire({
         title: "Success",
         text: "비밀번호 일치",
         icon: "success"
       });
     } else {
       Swal.fire({
         title: "Error",
         text: "비밀번호 불일치",
         icon: "error"
       });
     }
   }

function pwChkBtn(){
	Swal.close()
	//버튼 클릭시 해당 링크로 이동
	location.href="pw_mod";
}

   function pwChk() {
      var pw = $("#inputPw").val();
      $.ajax({
          url: "pw_update",
          type: "POST",
          data: {
              pw:pw // 사용자가 입력한 비밀번호 값을 전달
          },
          success: function(data) {
              if (data === "true") {
                 
                  // 비밀번호 일치하는 경우
                  Swal.fire({
                      title: "Success",
                      text: "비밀번호 일치",
                      icon: "success",
                      showConfirmButton: false,
                      html:'<button type="button" onclick="pwChkBtn()" class="btn btn-dark">확인</button>'
                  });
              } else {
                  // 비밀번호 불일치하는 경우
                  Swal.fire({
                      title: "Error",
                      text: "비밀번호 불일치",
                      icon: "error"
                  });
              }
          },
          error: function() {
              alert("실패");
          }
      });

   }
   
function delAccount(){
	 Swal.fire({
         title: "비밀번호 확인",
         text: "현재 비밀번호를 입력해 주세요",
         icon: "question",
         showConfirmButton: false,
         html:'<div class="row mb-3">\
				     <div class="form-floating mb-3 mb-md-3">\
				         <input class="form-control" id="delPw" type="text" placeholder="Enter your passwd"/>\
				         <label for="pw">비밀번호 입력</label>\
        	 			<input type="hidden" id="notPw">\
				 </div>\
				</div>\
				<div class="row mb-3">\
					<div class="col-md-5" style="margin:0 auto;">\
						<button class="btn btn-dark"  type="button" onclick="delete_account()">회원 탈퇴하기</button>\
					</div>\
				</div>'
     });
}
function delete_account(){
	var pw = $("#delPw").val();
	if(pw==""||pw==null){
		$("#notPw").attr("type","text");
		$("#notPw").val("비밀번호를 입력해 주세요");
	}else{
		$("#notPw").attr("type","hidden");
		$("#notPw").val("");
		 $.ajax({
		          url: "pw_update",
		          type: "POST",
		          data: {
		              pw:pw // 사용자가 입력한 비밀번호 값을 전달
		          },
		          success: function(data) {
		        	Swal.close()
		        	location.href="delete_account";
		          },
	              error: function() {
	          		$("#notPw").attr("type","text");
	        		$("#notPw").val("비밀번호가 틀렸습니다");
	              }
	          });
	}
}
   
   function campSaveBtn(){
      //유효성 검사
	  var content = tinymce.get("inputCon").getContent();
      var Addr_do = $("#sido option:selected").text();
      var Addr_si = $("#sigugun option:selected").text();
      //검사 시작
           // campsite 유효성 검사
           if ($("#campName").val().trim() === '') {
             alert("방 이름을 입력해주세요.");
             return;
           }

           if ($("#campPhone").val().trim() === '') {
             alert("연락처를 입력해주세요.");
             return;
           }

           if (Addr_do.trim() === '') {
             alert("주소(도)를 입력해주세요.");
             return;
           }

           if (Addr_si.trim() === '') {
             alert("주소(시)를 입력해주세요.");
             return;
           }
           // notice 유효성 검사
           if (content == '') {
        	   alert("공지사항을 입력해주세요.");
               return;
           }

           // room 유효성 검사
           $(".room_name").each(function() {
             if ($(this).val().trim() === '') {
               alert("룸 이름을 입력해주세요.");
               return false; // break를 위해 false 반환
             }
           });

           $(".room_max_cnt").each(function() {
             if ($(this).val().trim() === '') {
               alert("룸 최대 인원을 입력해주세요.");
               return false; // break를 위해 false 반환
             }
           });

           $(".room_basic_cnt").each(function() {
             if ($(this).val().trim() === '') {
               alert("룸 기본 인원을 입력해주세요.");
               return false; // break를 위해 false 반환
             }
           });

           $(".room_price").each(function() {
             if ($(this).val().trim() === '') {
               alert("룸 가격을 입력해주세요.");
               return false; // break를 위해 false 반환
             }
           });
           // 모든 유효성 검사 통과, form 제출
           $("#sido option:selected").attr("value", Addr_do);
           $("#sigugun option:selected").attr("value", Addr_si);
           $("#camp_save").submit();
      }

    
     //스크롤 애니메이션
     function scrollToElement(){
        var reviewPage  = $("#reviewPage").offset();
        $('html').animate({scrollTop : reviewPage.top}, 0);
     }