<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>ENJOY TRIP - REGISTER</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <!-- ======= Hero No Slider Section ======= -->
    <main id="main">
      <!-- ======= Contact Section ======= -->
      <section class="breadcrumbs">
        <div class="container">
          <div class="d-flex justify-content-between align-items-center">
            <ol>
              <li><a href="${root}/main.jsp">Home</a></li>
              <li>회원 가입</li>
            </ol>
          </div>
          <div class="login-page">
            <h2 class="text-center mt-5 mb-3">Register your own ID</h2>
            <div class="form col-lg-8 col-md-10 col-sm-12">
	            <div class="mb-3">
	              <label for="username" class="form-label float-start" style="font-size: 15px; margin-left:3px">이름:</label>
	              <input
	                type="text"
	                class="form-control"
	                id="input-name-register"
	                name="username"
	                placeholder="이름"
	              />
	            </div>
	            <div>
	              <div class="float-end" id="idcheck-result" style="font-size: 15px"></div>
	              <label for="userid" class="form-label float-start" style="font-size: 15px; margin-left:3px">아이디:</label>
		          <input
		              type="email"
		              class="form-control"
		              id="input-id-register"
		              name="userid"
		              placeholder="아이디"
		            />
	            </div>
	            <div class="mb-3 mt-3">
	              <label for="userpwd" class="form-label float-start" style="font-size: 15px; margin-left:3px">비밀번호:</label>
	              <input
	                type="password"
	                class="form-control"
	                id="input-pwd-register"
	                name="userpwd"
	                placeholder="비밀번호"
	              />
	            </div>
	            <div class="mb-3">
	              <label for="pwdcheck" class="form-label float-start" style="font-size: 15px; margin-left:3px">비밀번호 확인:</label>
	              <input type="password" class="form-control" id="input-pwd2-register" placeholder="비밀번호확인" />
	            </div>
	            <div>
	            	<button id="btn-register" class="mt-3 btn" style="color: white; background-color:#1E4356">회원가입</button>
	            </div>
	        </div>
          </div>
        </div>
      </section>

    </main>
    <!-- End Hero No Slider Section -->

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <!-- Template Main JS File -->
    
    <script>
    let isUseId = false;
    document.querySelector("#input-id-register").addEventListener("keyup", function () {
  	 let userid = this.value;
  	 let resultDiv = document.querySelector("#idcheck-result");
  	 if(!userid.includes("@")) {
  		 resultDiv.setAttribute("class", "text-danger float-end");
  		 resultDiv.setAttribute("style", "font-size:15px;display:inline-block");
  		 resultDiv.textContent = "아이디는 '@'를 포함한 Email 형식입니다.";
  		 isUseId = false;
       console.log("not @")
  	 } else {
  		console.log(userid);
      
      const info = {
        userId: userid
      }

      const option = {
        method: "POST",
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(info)
      }


			fetch(`${root}/user/idcheck`, option)
      .then(res => res.json())
				.then((data) => {
					if(data == 0) {
		    			   resultDiv.setAttribute("class", "text-primary float-end");
		    		  	   resultDiv.setAttribute("style", "font-size:15px;display:inline-block");
		    		       resultDiv.textContent = userid + "는 사용할 수 있습니다.";
		    		       isUseId = true;
		    			 } else {
		    			   resultDiv.setAttribute("class", "text-danger float-end");
		    		  	   resultDiv.setAttribute("style", "font-size:15px;display:inline-block");
		      		       resultDiv.textContent = userid + "는 사용할 수 없습니다.";
		      		       isUseId = false;
		    			 }

				});
		}
    });
    
    document.querySelector("#btn-register").addEventListener("click", function () {
        if (!document.querySelector("#input-name-register").value) {
          alert("이름 입력!!");
          return;
        } else if (!document.querySelector("#input-id-register").value) {
          alert("아이디 입력!!");
          return;
        } else if (!document.querySelector("#input-pwd-register").value) {
          alert("비밀번호 입력!!");
          return;
        } else if (document.querySelector("#input-pwd-register").value != document.querySelector("#input-pwd2-register").value) {
          alert("비밀번호 확인!!");
          return;
        } else if (!isUseId) {
          alert("아이디 확인!!");
          return;
        } else {
        //   let form = document.querySelector("#form-join");

          const resInfo = {
              userName: document.getElementById('input-name-register').value,
              userId: document.getElementById('input-id-register').value,
              userPwd: document.getElementById('input-pwd-register').value,
          };

          const option = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(resInfo)
          };

          fetch(`${root}/user/regist`, option)
          .then(res => {
            if(res.status == 200) window.location.href = '/';
          });

        //   form.setAttribute("action", "/user/regist");
        //   form.submit();
        }
      });
    </script>
  </body>
</html>
