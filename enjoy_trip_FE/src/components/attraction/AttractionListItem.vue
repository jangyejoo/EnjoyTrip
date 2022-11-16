<template>
  <b-col class="mb-3"
    ><b-card
      overlay
      img-src="https://picsum.photos/900/250/?image=3"
      img-alt="Card Image"
      text-variant="white"
      title="관광지 제목"
      img-height="220px"
      class="text-center"
      @click="showView = !showView"
    >
    </b-card>

    <!-- 관광지 상세정보 모달 -->
    <b-modal
      v-model="showView"
      size="xl"
      scrollable
      no-close-on-backdrop
      title="관광지 상세정보"
    >
      <b-container>
        <b-row class="gy-4">
          <b-col col lg="8" class="mb-3">
            <b-img
              src="https://picsum.photos/900/250/?image=3"
              rounded
              fluid
            ></b-img>
          </b-col>
          <b-col col lg="4" class="info">
            <b-card border-variant="dark" header="관광지 제목" align="left">
              <b-card-text><strong>Category</strong></b-card-text>
              <b-card-text><strong>Address</strong></b-card-text>
              <b-card-text><strong>Tel</strong></b-card-text>
            </b-card>
          </b-col>
        </b-row>
        <b-col col lg="12" class="overview">
          <h3>Overview</h3>
          <p>
            안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명
          </p>
          <p>
            안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명
          </p>
          <p>
            안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명
          </p>
          <p>
            안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명
          </p>
          <p>
            안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명안녕이건상세설명
          </p>
        </b-col>
      </b-container>

      <template #modal-footer>
        <div class="w-100">
          <b-button
            variant="primary"
            class="float-right"
            @click="showView = false"
          >
            확인!
          </b-button>
        </div>
      </template>
    </b-modal>
  </b-col>
</template>

<script>
export default {
  name: "AttractionListItem",
  data() {
    return {
      showView: false,
    };
  },
};
</script>

<style></style>
