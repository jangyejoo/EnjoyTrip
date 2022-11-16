<template>
  <div>
    <!-- 회원가입 -->
    <b-container>
      <b-col sm="6" offset-sm="3">
        <b-form-group label="이메일:" label-cols-sm="3">
          <b-form-input type="email"></b-form-input>
        </b-form-group>
      </b-col>

      <b-col sm="6" offset-sm="3">
        <b-form-group label="닉네임:" label-cols-sm="3">
          <b-form-input type="text"></b-form-input>
        </b-form-group>
      </b-col>

      <b-col sm="6" offset-sm="3">
        <b-form-group label="비밀번호:" label-cols-sm="3">
          <b-form-input type="password"></b-form-input>
        </b-form-group>
      </b-col>

      <b-col sm="6" offset-sm="3">
        <b-form-group label="비밀번호 확인:" label-cols-sm="3">
          <b-form-input type="password"></b-form-input>
        </b-form-group>
      </b-col>

      <b-button variant="primary">회원가입</b-button>
    </b-container>
  </div>
</template>

<script>
export default {};
</script>

<style></style>
