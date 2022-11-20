<template>
  <div>
    <b-row>
      <b-col sm="3">
        <b-list-group>
          <b-list-group-item @click="changeSide('my-info')">
            my info
          </b-list-group-item>
          <b-list-group-item @click="changeSide('modify-info')" active>
            modify info
          </b-list-group-item>
          <b-list-group-item href="#">Action links are easy</b-list-group-item>
          <b-list-group-item href="#foobar" disabled
            >Disabled link</b-list-group-item
          >
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
