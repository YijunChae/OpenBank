/**
 * <script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
 */

//quit
let requestMsg = function(event){
	event.preventDefault();
	let password = document.getElementById('password').value;
	let id = document.getElementById('customerId').value;
	
	$.ajax({
		url : '/ob/member/quit'
		, type : 'delete'
		, async : false
		, contentType: 'application/json'
		, data : JSON.stringify({
			customerId : id,
			password : password
		})
		, dataType : 'text'
		, success : function(result){
			alert(result)
		}
		, error : function(){
			alert("서버가 응답하지 않습니다. 다시 시도해주세요.")
		}
	})
	
}