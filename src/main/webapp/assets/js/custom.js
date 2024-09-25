// header 4try
	var header = document.querySelector('header');
	if(header!=null){
		var headerMoving = function(direction){
		  if (direction === "up"){
		    header.className = '';
		  } else if (direction === "down"){
		    header.className = 'scrollDown';
		  }
		};
		var prevScrollTop = 0;
		document.addEventListener("scroll", function(){
		  var nextScrollTop = window.pageYOffset || 0; // pageYOffset -> IE 8 이하 빼고 다 됨.
		  if (nextScrollTop > prevScrollTop){
		    headerMoving("down");
		  } else if (nextScrollTop < prevScrollTop){
		    headerMoving("up");
		  }
		  prevScrollTop = nextScrollTop;
		});
	}
		

// Sign up
	let zip = document.getElementById('zipNo');			
//	if(typeof zip!='undefined'){
	if(zip){
		if (typeof msg != 'undefined' && msg) {
	        alert("회원가입이 완료되었습니다! 로그인을 진행해주세요!");
	        location.href="/ob/member/signIn"
		}else if(zip.value==0){
			// ^^ 0뜨는 거 보기 싫어서 JS로 해결!
			zip.value = "";
		}else{
			console.log('test')	
		}
		
		function goPopup(){
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		    //var pop = 
		    window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		    
			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}
		/** API 서비스 제공항목 확대 (2017.02) **/
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
								, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadAddrPart1.value = roadAddrPart1;
			document.form.addrDetail.value = addrDetail;
			document.form.zipNo.value = zipNo;
		}

		zip.addEventListener('click', goPopup);
	}
	
	// 숫자만 입력받는 폼
	let onlyNum = function(id){
		let inputBox = document.getElementById(id);
		if(inputBox){
		    inputBox.addEventListener('input', function(){
			    this.value = this.value.replace(/[^0-9]/g, '');
			})
		}
	}
	let forCPwd = function(id){
		let inputBox = document.getElementById(id);
		if(inputBox){
		    inputBox.addEventListener('input', function(){
			    this.value = this.value.replace(/[^0-9]/g, '');
			    let errSpan = document.getElementById("error-"+id);
			    if (this.value.length !== 6) {
                	errSpan.textContent = '결제비밀번호는 6자리여야합니다';
            	} else {
                	errSpan.textContent = '';
            }
			})
		}
	}
	onlyNum('phoneNum');
	onlyNum('rrn');
	//onlyNum('wAcc');
	onlyNum('dAcc');
	onlyNum('amt');
	forCPwd('credit-password');
	onlyNum('credit-password-check');

/**
	let phoneNum = document.getElementById('phoneNum');
	if(phoneNum){
			phoneNum.addEventListener('input', function() {
	        this.value = this.value.replace(/[^0-9]/g, '');
	    });
    }
    let rrn = document.getElementById('rrn');
    if(rrn){
			rrn.addEventListener('input', function() {
	        this.value = this.value.replace(/[^0-9]/g, '');
	    });
	}
    let wAcc = document.getElementById('wAcc');
    if(wAcc){
			wAcc.value = "";
			wAcc.addEventListener('input', function() {
	        this.value = this.value.replace(/[^0-9]/g, '');
	    });
	}
    let amt = document.getElementById('amt');
    if(amt){
			amt.value = "";
			amt.addEventListener('input', function() {
	        this.value = this.value.replace(/[^0-9]/g, '');
	    });
	}
*/	

//open an account
	if(typeof accmsg!='undefined' && accmsg){
    	alert("계좌 생성이 완료되었습니다!");
    	location.href="/ob/account/"
	}

//profile
	if(typeof profile!='undefined'){
    	if(profile){
			alert("수정이 완료되었습니다");
			location.href="/ob/"
		}else{
			alert("수정에 실패했습니다. 내용을 다시 확인해주세요.");
		} 
	}
	
//sign in
//	if(!login){
/*	
	if(typeof login!='undefined' && !login){
    	alert("아이디 또는 비밀번호가 다릅니다.");
		login = true;
	}
	*/