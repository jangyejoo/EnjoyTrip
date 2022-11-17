<template>
  <!-- 관광지 상세정보 모달 -->
  <b-modal
    v-if="detail && detail.length != 0"
    v-model="modalState"
    size="lg"
    scrollable
    no-close-on-backdrop
    hide-footer
    title="관광지 상세정보"
    @hidden="close"
  >
    <b-container>
      <b-row class="gy-4">
        <b-col col lg="8" class="mb-3">
          <b-img
            :src="detail.firstImage"
            rounded
            style="width: 100%; heigth: 500px"
          ></b-img>
        </b-col>
        <b-col col lg="4" class="info">
          <b-card border-variant="dark" :header="detail.title" align="left">
            <b-card-text
              ><strong>Category</strong>
              {{ detail.contentTypeName }}</b-card-text
            >
            <b-card-text v-if="detail.addr1 && detail.addr1.length != 0"
              ><strong>Address</strong> {{ detail.addr1 }}
              {{ detail.addr2 }}</b-card-text
            >
            <b-card-text v-if="detail.tel && detail.tel.length != 0"
              ><strong>Tel</strong> {{ detail.tel }}</b-card-text
            >
          </b-card>
        </b-col>
      </b-row>
      <b-col
        col
        lg="12"
        class="overview"
        v-if="detail.overview && detail.overview.length != 0"
      >
        <h3>Overview</h3>
        <p>
          {{ detail.overview }}
        </p>
      </b-col>
    </b-container>
  </b-modal>
</template>

<script>
import { mapState, mapMutations, mapGetters } from "vuex";

export default {
  name: "AttractionDetail",
  computed: {
    ...mapState(["detail", "isModalOpen"]),
    ...mapGetters({
      value: "modalState",
    }),
    modalState: {
      get() {
        return this.value;
      },
      set(newValue) {
        return newValue;
      },
    },
  },
  methods: {
    ...mapMutations(["MODAL_SWITCH"]),
    close() {
      this.MODAL_SWITCH(false);
    },
  },
};
</script>

<style></style>
