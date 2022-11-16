<template>
  <b-row class="mt-4 mb-4 text-center">
    <b-col class="sm-3">
      <b-form-select v-model="sidoCode"></b-form-select>
    </b-col>
    <b-col class="sm-3">
      <b-form-select v-model="gugunCode"></b-form-select>
    </b-col>
    <b-col class="sm-3">
      <b-button variant="outline-primary">Button</b-button>
    </b-col>
  </b-row>
</template>

<script>
export default {
  name: "AttractionSearchBar",
};
</script>

<style></style>
