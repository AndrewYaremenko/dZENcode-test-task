<template>
  <nav aria-label="Page navigation">
    <ul class="pagination">
      <li class="page-item" :class="{ disabled: currentPage === 1 }">
        <a class="page-link" href="" @click.prevent="prevPage">←</a>
      </li>
      <li class="page-item">
        <span class="page-link">{{ currentPage }}</span>
      </li>
      <li class="page-item" :class="{ disabled: currentPage === totalPages || totalPages === 1 }">
        <a class="page-link" href="" @click.prevent="nextPage">→</a>
      </li>
    </ul>

  </nav>
</template>

<script>
export default {
  props: {
    currentPage: null,
    totalPages: null,
  },
  methods: {
    prevPage() {
      if (this.currentPage > 1) {
        this.$emit("prevPage");
      }
    },
    nextPage() {
      if (this.currentPage < this.totalPages) {
        this.$emit("nextPage");
      }
    },
  },
};
</script>