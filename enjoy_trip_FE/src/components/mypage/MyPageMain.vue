<template>
  <b-container>
    <b-row>
      <b-col sm="3">
        <b-list-group ref="selectors">
          <b-list-group-item @click="changeSide('my-info')" id="my-info">
            내 정보
          </b-list-group-item>
          <b-list-group-item
            @click="changeSide('modify-info')"
            id="modify-info"
          >
            개인정보 수정
          </b-list-group-item>
          <b-list-group-item
            @click="changeSide('delete-user')"
            id="delete-user"
          >
            회원 탈퇴
          </b-list-group-item>
        </b-list-group>
      </b-col>
      <b-col sm="9">
        <my-page-content></my-page-content>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import MyPageContent from "@/components/mypage/MyPageContent.vue";
import { mapActions, mapGetters } from "vuex";

const myPageStore = "myPageStore";

export default {
  components: { MyPageContent },
  computed: {
    ...mapGetters(myPageStore, ["getSection"]),
    changeNav: function () {
      return this.getSection;
      // console.log(curSection);
    },
  },
  methods: {
    ...mapActions(myPageStore, ["setCurSection"]),
    changeSide(mode) {
      this.setCurSection(mode);
    },
  },
  watch: {
    changeNav(value) {
      for (const item of this.$refs.selectors.children) {
        if (item.id == value) {
          item.classList.add("active");
        } else {
          item.classList.remove("active");
        }
      }
    },
  },
  mounted() {
    for (const item of this.$refs.selectors.children) {
      if (item.id == this.getSection) {
        item.classList.add("active");
      } else {
        item.classList.remove("active");
      }
    }
  },
};
</script>

<style scoped>
.container {
  position: relative;
  top: 50px;
}
</style>
