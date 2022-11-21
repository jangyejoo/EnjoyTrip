<template>
  <b-container
    v-if="attractions && attractions.length != 0"
    class="bv-example-row mt-3"
  >
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 mt-3">
      <attraction-list-item
        v-for="(attraction, index) in listData"
        :key="index"
        :attraction="attraction"
      ></attraction-list-item>
    </div>
    <pagination-bar
      :pageSetting="
        pageDataSetting(this.attractions.length, limit, block, this.page)
      "
      @paging="pagingMethod"
    ></pagination-bar>

    <attraction-detail></attraction-detail>
  </b-container>
  <b-container v-else class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show variant="danger">관광지가 없습니다.</b-alert>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import AttractionListItem from "@/components/attraction/AttractionListItem.vue";
import AttractionDetail from "@/components/attraction/AttractionDetail.vue";
import PaginationBar from "@/components/common/Pagination.vue";

import { mapState } from "vuex";

export default {
  name: "AttractionList",
  components: {
    AttractionListItem,
    AttractionDetail,
    PaginationBar,
  },
  data() {
    return {
      listData: [],
      page: 1,
      limit: 12,
      block: 5,
    };
  },
  computed: {
    ...mapState("attraction", ["attractions"]),
  },
  watch: {
    attractions: {
      handler() {
        this.pagingMethod(1);
      },
    },
  },
  mounted() {
    this.pagingMethod(this.page);
  },
  methods: {
    pagingMethod(page) {
      this.listData = this.attractions.slice(
        (page - 1) * this.limit,
        page * this.limit
      );
      this.page = page;
      this.pageDataSetting(this.total, this.limit, this.block, page);
    },
    pageDataSetting(total, limit, block, page) {
      const totalPage = Math.ceil(total / limit);
      let currentPage = page;
      const first =
        currentPage > 1 ? parseInt(currentPage, 10) - parseInt(1, 10) : null;
      const end =
        totalPage !== currentPage
          ? parseInt(currentPage, 10) + parseInt(1, 10)
          : null;

      let startIndex = (Math.ceil(currentPage / block) - 1) * block + 1;
      let endIndex =
        startIndex + block > totalPage ? totalPage : startIndex + block - 1;
      let list = [];
      for (let index = startIndex; index <= endIndex; index++) {
        list.push(index);
      }
      const totalItemLength = this.attractions.length;
      return { first, end, list, currentPage, totalItemLength, totalPage };
    },
  },
};
</script>

<style></style>
