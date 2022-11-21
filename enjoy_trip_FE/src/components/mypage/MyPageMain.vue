<template>
  <div>
    <b-row>
      <b-col sm="3">
        <b-list-group>
          <b-list-group-item @click="changeSide('my-info')">
            내 정보
          </b-list-group-item>
          <b-list-group-item @click="changeSide('modify-info')" active>
            개인정보 수정
          </b-list-group-item>
          <b-list-group-item @click="changeSide('delete-user')">
            회원 탈퇴
          </b-list-group-item>
        </b-list-group>
      </b-col>
      <b-col sm="9">
        <my-page-content></my-page-content>
      </b-col>
    </b-row>
  </div>
</template>

<script>
import MyPageContent from "@/components/mypage/MyPageContent.vue";
import { mapActions } from "vuex";

const myPageStore = "myPageStore";

export default {
  components: { MyPageContent },
  methods: {
    ...mapActions(myPageStore, ["setCurSection"]),
    changeSide(mode) {
      this.setCurSection(mode);
    },
  },
};
</script>

<style></style>
