$(document).ready(function(){
    	var endDate = document.getElementById("endDate");
    	var startDate = document.getElementById("startDate");
        var today = new Date();

        let fm = function(today){
            var year = today.getFullYear();
            var month = today.getMonth() + 1; // 월이 0부터 시작함
            var day = today.getDate();
 			
            if (month < 10) {
                month = "0" + month;
            }
            if (day < 10) {
                day = "0" + day;
            }
        	return year + "-" + month + "-" + day;
		}
        endDate.value = fm(today);
        today.setMonth(today.getMonth() - 1);
        startDate.value = fm(today);
    	
    	
    	document.getElementById('btn1').addEventListener('click', function() {
    		$('#staticBackdrop').modal('show');
        });
		var ing = true;
    	$('#form').on('submit', function(e){
    		if(!ing) return true;
    		e.preventDefault();
    		var cp = $('#credit-password').val();
    		if(cp!='' && ing){
	    		$.ajax({
	                type: 'POST',
	                url: '/ob/member/credit-password',
	                data: { creditPassword: cp },
	                success: function(result) {
	                	if(result){
	                		console.log("success")
	                		$('#form').submit();
	                		ing=false;
	                		return true;
	                	}
	                	else alert('비밀번호가 맞지 않습니다.')
	                }, error: function(error) {
	                    alert('잘못된 요청입니다');
	                    console.error(error);
	                }
	            });
    		}else{
    			alert("결제 비밀번호를 입력해주세요")
    			$('#credit-password').focus()
    		}
		});
		$('#searchBtn').click(function() {
			let pg = 1;
			let stD = document.getElementById("startDate").value;
			let enD = document.getElementById("endDate").value;
			let params = new URLSearchParams({
					accNum : acc
					, startDate : stD
					, endDate : enD
					, page : pg
			})
			let url = '/ob/api/account/transaction?'+params;
			fetch(url, {
				mode: 'cors'
			})
			.then(function(response) {
				return response.json()
			}).then(getTran)
			
			
		})
		$('#searchBtn').trigger('click');
});

		
let getTran = function(result) {
		let list = result.transaction;
		let size = result.size;
		let bal = parseFloat(result.amount);
		if(size==0) return;
		$('#transactionTable').html('<tr><th>거래일자</th><th>거래명</th><th >입금 금액</th><th >출금 금액</th><th >잔액</th></tr>')
		for(let tran of list) {
			if(tran.transactionType=='입금'){
			$('#transactionTable').append('<tr><td>'+tran.transactionDate+'</td><td>'
											+tran.withdrawName+'</td>'
											+'<td>'+tran.amount.toLocaleString()+'</td><td></td>'
											+'<td>'+bal.toLocaleString()+'</td></tr>');
			bal-=parseFloat(tran.amount);
			}else{
			$('#transactionTable').append('<tr><td>'+tran.transactionDate+'</td><td>'
											+tran.withdrawName+'</td>'
											+'<td></td><td>'+tran.amount.toLocaleString()+'</td>'
											+'<td>'+tran.amount.toLocaleString()+'</td></tr>');
			bal+=parseFloat(tran.amount);
			}
		}
	} 
	let pg = 2;
	let isFetching = false;
window.onscroll = function(e) {
      if(!isFetching && (window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
        isFetching =true;
        setTimeout(function(){
          let stD = document.getElementById("startDate").value;
			let enD = document.getElementById("endDate").value;
			let params = new URLSearchParams({
					accNum : acc
					, startDate : stD
					, endDate : enD
					, page : pg
			})
			let url = '/ob/api/account/transaction?'+params;
			fetch(url, {
				mode: 'cors'
			})
			.then(function(response) {
				console.log(pg+" "+bal)
				return response.json()
			}).then(getTran)
			.then(function(){
				pg+=1
				isFetching=false;
			})
        }, 750)  
      }
    }