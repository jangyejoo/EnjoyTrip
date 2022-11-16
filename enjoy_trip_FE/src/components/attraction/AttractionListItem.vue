<template>
  <b-col class="mb-3"
    ><b-card
      :img-src="attraction.firstImage"
      img-alt="Card Image"
      img-top
      :title="attraction.title"
      title-tag="strong"
      img-height="250px"
      @click="showView = !showView"
      tag="article"
      style="max-width: 20rem; max-height: 25rem"
      class="mb-2"
    >
      <b-card-text
        ><p class="mb-0">{{ attraction.contentTypeName }}</p>
        <!-- <p class="mb-0" v-if="attraction.addr1 && attraction.addr1.length != 0">
          {{ attraction.addr1 }} {{ attraction.addr2 }}
        </p>
        <p class="mb-0" v-if="attraction.tel && attraction.tel.length != 0">
          {{ attraction.tel }}
        </p> -->
      </b-card-text>
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
              :src="attraction.firstImage"
              rounded
              style="width: 100%; heigth: 500px"
            ></b-img>
          </b-col>
          <b-col col lg="4" class="info">
            <b-card
              border-variant="dark"
              :header="attraction.title"
              align="left"
            >
              <b-card-text
                ><strong>Category</strong>
                {{ attraction.contentTypeName }}</b-card-text
              >
              <b-card-text
                v-if="attraction.addr1 && attraction.addr1.length != 0"
                ><strong>Address</strong> {{ attraction.addr1 }}
                {{ attraction.addr2 }}</b-card-text
              >
              <b-card-text v-if="attraction.tel && attraction.tel.length != 0"
                ><strong>Tel</strong> {{ attraction.tel }}</b-card-text
              >
            </b-card>
          </b-col>
        </b-row>
        <b-col
          col
          lg="12"
          class="overview"
          v-if="attraction.overview && attraction.overview.length != 0"
        >
          <h3>Overview</h3>
          <p>
            {{ attraction.overview }}
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
  props: {
    attraction: Object,
  },
};
</script>

<style></style>
