<template>
  <div class="col-md-8 offset-md-3 mt-5">
    <SortingComponent @sortBy="sortBy" />
    <PaginationComponent
      :currentPage="currentPage"
      :totalPages="totalPages"
      @prevPage="prevPage"
      @nextPage="nextPage"
    />
    <CommentsComponent
      :comments="comments"
    />
  </div>
</template>

<script>
import SortingComponent from "./ui/SortingComponent.vue";
import CommentsComponent from "./ui/CommentsComponent.vue";
import PaginationComponent from "./ui/PaginationComponent.vue";
import axios from "axios";

export default {
  components: {
    SortingComponent,
    CommentsComponent,
    PaginationComponent,
  },
  data() {
    return {
      comments: [],
      sort: "",
      currentPage: 1,
      totalPages: 0,
    };
  },
  created() {
    this.fetchComments();
  },
  methods: {
    sortBy(field) {
      this.sort = field;
      this.currentPage = 1;
      this.fetchComments();
    },
    fetchComments() {
      axios
        .get("/api/comments", {
          params: {
            sort: this.sort,
            page: this.currentPage,
          },
        })
        .then((response) => {
          this.comments = response.data.data;
          this.totalPages = response.data.meta.last_page;
        })
        .catch((error) => {
          console.error("Error during getcomments", error);
        });
    },
    prevPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
        this.fetchComments();
      }
    },
    nextPage() {
      if (this.currentPage < this.totalPages) {
        this.currentPage++;
        this.fetchComments();
      }
    },
  },
};
</script>
