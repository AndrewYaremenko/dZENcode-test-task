<template>
  <div class="container mt-3">
    <FormComponent></FormComponent>
    <CommentsComponent></CommentsComponent>
  </div>
</template>

<script>
import FormComponent from "./ui/FormComponent.vue";
import CommentsComponent from "./ui/CommentsComponent.vue";

export default {
  components: {
    FormComponent,
    CommentsComponent,
  },
};
</script>