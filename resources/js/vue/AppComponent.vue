<template>
  <div class="container mt-3">
    <FormComponent></FormComponent>
    <TableComponent ref="commentsComponent"></TableComponent>
  </div>
</template>

<script>
import FormComponent from "./components/FormComponent.vue";
import TableComponent from "./components/TableComponent.vue";

export default {
  components: {
    FormComponent,
    TableComponent,
  },
};
</script>