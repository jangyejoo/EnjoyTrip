<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>ENJOY TRIP - MYPAGE</title>
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
              <li>마이페이지</li>
            </ol>
          </div>
          <div class="login-page">
            <h2 class="text-center mt-5 mb-3">마이 페이지</h2>
            <div class="form">
	            <div>
	              <label for="userid" class="form-label">아이디</label>
		          <input
		            type="email"
		            class="form-control"
		            id="input-id-register"
		            name="userid"
		            value="${userInfo.userId}"
                    readonly
					style="color: black; background-color: #ddd5d5; font-weight:bold"
		            />
	            </div>
	            <div class="mb-5 mt-3">
	              <label for="userpwd" class="form-label">비밀번호 </label>
	              <input
	                type="password"
	                class="form-control"
	                id="input-pwd-register"
	                name="userpwd"
		            value="${userInfo.userPwd}"
                    readonly
					style="color: black; background-color: #ddd5d5; font-weight:bold"
	              />
	            </div>
	            <div class="mb-3 mt-3">
	              <label for="username" class="form-label">이름 </label>
	              <input
	                type="text"
	                class="form-control"
	                id="input-name-register"
	                name="username"
		            value="${userInfo.userName}"
                    readonly
					style="color: black; background-color: #ddd5d5; font-weight:bold"
	              />
	            </div>
	            <div class="mb-3">
	              <label for="joindate" class="form-label">가입일자 </label>
	              <input
	                type="text"
	                class="form-control"
	                id="input-joindate-register"
	                name="joindate"
		            value="${userInfo.joinDate}"
                    readonly
					style="color: black; background-color: #ddd5d5; font-weight:bold"
	              />
	            </div>
                <button
                  type="button"
                  class="mt-5 btn"
                  onclick="location.href='${root}/editprofile'"
                 style="color: white; background-color:#1E4356"
                >
                  회원 정보 수정하기
                </button>
	            <button
                  type="button"
                  class="mt-3 btn"
                  data-bs-toggle="modal"
                  data-bs-target="#deleteModal"
                  style="color: #1E4356; background-color:#ffffff; font-weight:bold; border: 1px solid #1E4356;"
                >
                  회원 탈퇴
                </button>
            </div>
          </div>
        </div>
      </section>
    </main>
    <div
      class="modal fade"
      id="deleteModal"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">회원 탈퇴하기</h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <form id="form-delete" method="POST" action="#">
            	<input type="hidden" name="act" value="delete">
              <div class="mb-3">
                <i class="bi bi-patch-question"></i>
                <label for="question" class="form-label" style="font-size:18px">정말로 회원 탈퇴를 하시겠습니까?</label>
              </div>
              <div class="mb-3">
                <label for="question" class="form-label">현재 비밀번호를 입력하세요.</label>
                <input
                  type="password"
                  class="form-control"
                  id="current-pwd"
                  placeholder="비밀번호"
                  name="currentpwd"
                />
              </div>
            </form>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-dark" id="btn-delete">
              회원 탈퇴
            </button>
            <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">
              취소
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- End Hero No Slider Sectio -->

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script>
    document.querySelector("#btn-delete").addEventListener("click", function(){
      console.log('click')
    	// if (!document.querySelector("#current-pwd").value) {
      //       alert("현재 계정의 비밀번호를 입력하세요!!");
      //       return;
      //     } 
    	if (document.querySelector("#current-pwd").value == `${userInfo.userPwd}`) {	
        const delInfo = {
          userId: document.getElementById('input-id-register').value
        }

        const option = {
          method: 'DELETE',
          headers:{
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(delInfo)
        }

        fetch(`${root}/user/delete`, option)
        .then(res => {if(res.status == 200) location.href='/'})
        // .then(res => console.log(res.status))
    	}else{
    		alert("비밀번호가 틀렸습니다!!");
    		return;
    	}
	});
    </script>
  </body>
</html>
