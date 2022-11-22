<template>
  <div>
    <b-col class="mb-3">
      <article
        class="card mb-2"
        style="max-width: 25rem, max-height:23 rem"
        @click="selectAttraction"
      >
        <div class="img-wrapper" style="overflow: hidden">
          <img
            :src="attraction.firstImage"
            alt="Card Image"
            class="card-img-top"
            style="height: 250px"
          />
        </div>
        <div class="card-body">
          <strong class="card-title">{{ attraction.title }}</strong>
          <div class="card-text">
            <p class="mb-0">{{ attraction.contentTypeName }}</p>
          </div>
        </div>
      </article>
    </b-col>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";

export default {
  name: "AttractionListItem",
  data() {
    return {};
  },
  props: {
    attraction: Object,
  },
  computed: {
    ...mapState("attraction", ["isAttractionModalOpen"]),
  },
  methods: {
    ...mapActions("attraction", ["detailAttraction"]),
    selectAttraction() {
      this.detailAttraction(this.attraction);
    },
  },
};
</script>

<style scoped>
.card-title {
  display: block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.card:hover {
  cursor: pointer;
}
.img-wrapper {
  overflow: hidden;
}
.card-img-top {
  transition: all 0.2s linear;
}
.card-img-top:hover {
  transform: scale(1.4);
}
</style>
