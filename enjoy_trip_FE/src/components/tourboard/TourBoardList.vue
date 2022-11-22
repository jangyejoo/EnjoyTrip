<template>
  <b-container v-if="tours && tours.length != 0" class="bv-example-row mt-3">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 mt-3">
      <tour-board-list-item
        v-for="(tour, index) in listData"
        :key="index"
        :tour="tour"
      ></tour-board-list-item>
    </div>
    <pagination-bar
      :pageSetting="pageDataSetting(this.tours.length, limit, block, this.page)"
      @paging="pagingMethod"
    ></pagination-bar>

    <tour-board-detail></tour-board-detail>
  </b-container>
  <b-container v-else class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show variant="danger">공유되는 여행 계획이 없습니다.</b-alert>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import TourBoardListItem from "@/components/tourboard/TourBoardListItem";
import TourBoardDetail from "@/components/tourboard/TourBoardDetail.vue";
import PaginationBar from "@/components/common/Pagination.vue";

import { mapState } from "vuex";

export default {
  name: "TourBoardList",
  components: {
    TourBoardListItem,
    TourBoardDetail,
    PaginationBar,
  },
  data() {
    return { listData: [], page: 1, limit: 20, block: 5 };
  },
  computed: {
    ...mapState("attraction", ["tours"]),
  },
  watch: {
    tours: {
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
      this.listData = this.tours.slice(
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
      const totalItemLength = this.tours.length;
      return { first, end, list, currentPage, totalItemLength, totalPage };
    },
  },
};
</script>

<style></style>
