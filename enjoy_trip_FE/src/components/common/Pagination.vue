<template>
  <b-row v-if="pageSetting.list.length" class="page-list">
    <b-list-group horizontal class="pagination">
      <b-list-group-item
        color="#dfdfdf"
        @click="pageSetting.first !== null ? sendPage(1) : ''"
        ><font-awesome-icon icon="fa-solid fa-backward" />
      </b-list-group-item>

      <b-list-group-item
        :disabled="pageSetting.first == null"
        color="#dfdfdf"
        @click="pageSetting.first !== null ? sendPage(pageSetting.first) : ''"
        ><font-awesome-icon icon="fa-solid fa-arrow-left" />
      </b-list-group-item>
      <b-list-group-item
        :class="{ active: page === pageSetting.currentPage }"
        v-for="page in pageSetting.list"
        :key="page"
        @click="sendPage(page)"
        >{{ page }}
      </b-list-group-item>
      <b-list-group-item
        :disabled="pageSetting.end == null"
        @click="pageSetting.end !== null ? sendPage(pageSetting.end) : ''"
        ><font-awesome-icon icon="fa-solid fa-arrow-right" />
      </b-list-group-item>
      <b-list-group-item
        color="#dfdfdf"
        @click="pageSetting.end !== null ? sendPage(pageSetting.totalPage) : ''"
        ><font-awesome-icon icon="fa-solid fa-forward" />
      </b-list-group-item>
    </b-list-group>
  </b-row>
</template>

<script>
export default {
  name: "PaginationBar",
  props: ["pageSetting"],
  methods: {
    sendPage(page) {
      this.$emit("paging", page);
    },
  },
};
</script>

<style scoped>
.page-list {
  float: none;
  margin: 0 auto;
}
.pagination {
  float: none;
  margin: 0 auto;
}
</style>
