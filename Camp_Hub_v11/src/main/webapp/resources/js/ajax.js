function inputReply() {
	ipReply();
}
function ipReply() {
	var con = $("#replyCon").text();
	var b_num = $("#b_num").val();
	$
			.ajax({
				url : "input_reply",
				type : "POST",
				dataType : "json",
				data : {
					con : con,
					b_num : b_num
				},
				success : function(response) {
					var htmlContent = '<div class="row form-floating mt-3" id="replyDiv'
							+ response.num
							+ '">'
							+ '<div class="col-10">'
							+ '<span>'
							+ response.nick_name
							+ '</span>&nbsp;'
							+ '<span class="vr"></span>&nbsp;'
							+ '<span>'
							+ response.grade
							+ '</span>&nbsp;'
							+ '<span class="vr"></span>&nbsp;'
							+ '<span>'
							+ response.indate
							+ '</span> '
							+ '<button class="btn btn-dark btn-sm" onclick="reply_mod('
							+ response.num
							+ ')">수정</button> '
							+ '<button class="btn btn-dark btn-sm" onclick="reply_del('
							+ response.num
							+ ')">삭제</button> '
							+ '</div>'
							+ '<a class="btn btn-success btn-sm col" onclick="replyLovePlus('
							+ response.num + ', \'' + response.nick_name + '\')">추천 '
							+ '<span id="replyNum'
							+ response.num
							+ '">'
							+ response.love
							+ '</span></a>'
							+ '<textarea  class="form-control custom-textarea" type="text" id="replyText'+response.num+'">'
							+ response.con + '</textarea>' + '</div>';

					$("#replyDiv").append(htmlContent);
					$('#replyCon').text('');

				},
				error : function() {
					alert("글 작성 실패");
				}
			});
}
function lovePlus(cnt){
	   var num = $("#b_num").val();
	   var nick_name=$("#nick_name").val();
	   $.ajax({
	         url: "detailBoard_love",
	          type: "POST",
	          dataType: "json",
	          data:{
	             num:num,
	             nick_name:nick_name
	          }, success: function(response){
	             $("#loveCnt").html(response);
	          },
	          error: function() {
	              alert("좋아요 실패");
	          }
	      
	   });
	}

function replyLovePlus(cnt,nick){
	   var num = cnt
	   var nick_name=nick
	   $.ajax({
	         url: "reply_love",
	          type: "POST",
	          dataType: "json",
	          data:{
	             num:num,
	             nick_name:nick_name
	          }, success: function(response){
	             $("#replyNum"+cnt).text(response);
	          },
	          error: function() {
	              alert("추천 실패");
	          }
	      
	   });
	}

function reply_mod(num) {
	var con = $("#replyText" + num).val();

	var num = num;
	$.ajax({
		url : "reply_mod",
		type : "POST",
		dataType : "json",
		data : {
			con : con,
			num : num
		},
		success : function(response) {
			$("#replyText" + num).val(response.con);
			alert("수정 완료");
		},
		error : function() {
			alert("수정 실패");
		}
	});
}

function reply_del(num) {
	var num = num;
	$.ajax({
		url : "reply_del",
		type : "POST",
		data : {
			num : num
		},
		success : function() {
			$("#replyDiv" + num).remove();
		},
		error : function() {
			alert("삭제 실패");
		}
	});
}