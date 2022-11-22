<template>
  <!-- Footer -->
  <mdb-footer class="font-small pt-4 mt-4 shadow">
    <mdb-container class="text-left">
      <h5 class="title mt-4">
        <img
          src="@/assets/img/logo_keyColor.png"
          alt="로고"
          style="width: 80px"
        />
      </h5>

      <mdb-row class="mt-5">
        <mdb-col sm="9">
          <h5><strong>CONTACT</strong></h5>
          <p>
            <font-awesome-icon icon="fa-solid fa-map-pin" />
            서울특별시 강남구 역삼동 테헤란로 212 &nbsp; &nbsp;
            <font-awesome-icon icon="fa-solid fa-phone" />
            +82 010 1234 1234 &nbsp; &nbsp;

            <font-awesome-icon icon="fa-solid fa-envelope" />
            info@example.com
          </p>
          <p class="mt-4" style="color: #666666">
            Enjoy Trip에서는 다양한 관광지 정보를 소개합니다!
            <br />
            저희의 서비스에 관해 더 알고 싶다면 아래 링크를 참고하세요
            <br />
          </p>
          <ul style="margin: 0; padding: 0">
            <a href="#" class="twitter mr-2">
              <font-awesome-icon
                icon="fa-brands fa-twitter"
                class="fa-2xl"
                color="#00ce7c"
              />
            </a>
            <a href="#" class="facebook mr-2"
              ><font-awesome-icon
                icon="fa-brands fa-facebook"
                class="fa-2xl"
                color="#00ce7c"
              />
            </a>
            <a href="#" class="instagram">
              <font-awesome-icon
                icon="fa-brands fa-instagram"
                class="fa-2xl"
                color="#00ce7c"
              />
            </a>
          </ul>
        </mdb-col>
      </mdb-row>
    </mdb-container>
    <div class="footer-copyright text-center py-3 mt-4">
      <mdb-container fluid>
        &copy; Copyright
        <strong><span>Enjoy Trip</span></strong>
        . All Rights Reserved
      </mdb-container>
    </div>
  </mdb-footer>
  <!-- Footer -->
</template>

<script>
import { mdbFooter, mdbContainer, mdbRow, mdbCol } from "mdbvue";
export default {
  name: "FooterPage",
  components: { mdbFooter, mdbContainer, mdbRow, mdbCol },
};
</script>

<style scoped>
p {
  color: #666666;
}
</style>
