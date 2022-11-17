<template>
  <div>
    <b-col class="mb-3"
      ><b-card
        class="mb-2"
        :img-src="attraction.firstImage"
        img-alt="Card Image"
        img-top
        img-height="250px"
        tag="article"
        style="max-width: 25rem; max-height: 23rem"
        @click="selectAttraction"
      >
        <b-card-title :title="attraction.title" title-tag="strong" />
        <b-card-text
          ><p class="mb-0">{{ attraction.contentTypeName }}</p>
        </b-card-text>
      </b-card>
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
    ...mapState(["isModalOpen"]),
  },
  methods: {
    ...mapActions(["detailAttraction"]),
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
</style>
