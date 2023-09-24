<template>
  <div class="col-md-8 offset-md-3 mt-5">
    Sorting<br />
    <div class="btn-group mb-2" role="group" aria-label="Basic example">
      <button
        @click="sortBy('new')"
        type="button"
        class="btn btn-success sort_date"
      >
        New
      </button>
      <button
        @click="sortBy('old')"
        type="button"
        class="btn btn-success sort_date"
      >
        Old
      </button>
      <button
        @click="sortBy('name')"
        type="button"
        class="btn btn-success sort_name"
      >
        Name
      </button>
      <button
        @click="sortBy('email')"
        type="button"
        class="btn btn-success sort_email"
      >
        Email
      </button>
    </div>

    <nav aria-label="Page navigation">
      <ul class="pagination">
        <li class="page-item" :class="{ disabled: currentPage === 1 }">
          <a class="page-link" href="" @click.prevent="prevPage">Previous</a>
        </li>
        <li
          class="page-item"
          v-for="pageNumber in totalPages"
          :key="pageNumber"
          :class="{ active: currentPage === pageNumber }"
        >
          <a class="page-link" href="" @click.prevent="goToPage(pageNumber)">{{
            pageNumber
          }}</a>
        </li>
        <li class="page-item" :class="{ disabled: currentPage === totalPages }">
          <a class="page-link" href="" @click.prevent="nextPage">Next</a>
        </li>
      </ul>
    </nav>

    <div
      class="col-md-9 alert alert-secondary"
      v-for="comment in comments"
      :key="comment.id"
    >
      <div class="d-flex justify-content-between">
        <div>
          <strong>{{ comment.username }}</strong>
        </div>
        <div>
          <span>#{{ comment.id }}</span>
        </div>
      </div>
      <div>
        <span>{{ comment.email }}</span>
      </div>
      <div class="d-flex justify-content-between">
        <div>
          <span>{{ comment.date }}</span>
        </div>
        <div>
          <span>{{ comment.homepage }}</span>
        </div>
      </div>
      <hr />
      <p>{{ comment.content }}</p>

      <div class="d-flex justify-content-end">
        <button class="btn btn-primary">Comment it</button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
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
          console.error("Error during at getcomments", error);
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
    goToPage(pageNumber) {
      if (pageNumber !== this.currentPage) {
        this.currentPage = pageNumber;
        this.fetchComments();
      }
    },
  },
};
</script>
