<template>
  <div class="row">
    <div class="col-md-4 offset-md-4">
      <form @submit.prevent="submitForm">
        <div class="mb-2">
          <label for="name" class="form-label">User Name</label>
          <input
            type="text"
            class="form-control"
            id="name"
            name="name"
            placeholder="User Name"
            v-model="name"
          />
        </div>
        <div class="mb-2">
          <label for="email" class="form-label">Email</label>
          <input
            type="text"
            class="form-control"
            id="email"
            name="email"
            placeholder="Email"
            v-model="email"
          />
        </div>
        <div class="mb-2">
          <label for="homepage" class="form-label">Home page</label>
          <input
            type="text"
            class="form-control"
            id="homepage"
            name="homepage"
            placeholder="Home page"
            v-model="homepage"
          />
        </div>
        <div class="mb-3">
          <label for="content" class="form-label">Content</label>
          <textarea
            class="form-control"
            id="content"
            name="content"
            rows="2"
            placeholder="Content"
            v-model="content"
          ></textarea>
          <div class="btn-group mt-1" role="group" aria-label="Basic example">
            <button
              type="button"
              class="btn btn-secondary tag_a_text"
              @click="insertTag('<a href=&quot;&quot; title=&quot;&quot;></a>')"
            >
              &lt;a&gt;
            </button>
            <button
              type="button"
              class="btn btn-secondary tag_code_text"
              @click="insertTag('<code></code>')"
            >
              &lt;code&gt;
            </button>
            <button
              type="button"
              class="btn btn-secondary tag_i_text"
              @click="insertTag('<i></i>')"
            >
              &lt;i&gt;
            </button>
            <button
              type="button"
              class="btn btn-secondary tag_strong_text"
              @click="insertTag('<strong></strong>')"
            >
              &lt;strong&gt;
            </button>
          </div>
        </div>

        <div class="mb-2">
          <label for="file" class="form-label">File</label>
          <input
            type="file"
            class="form-control"
            id="file"
            name="file"
            placeholder="file"
          />
        </div>

        <button type="submit" class="btn btn-primary">Comment</button>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      name: "",
      email: "",
      homepage: "",
      content: "",
    };
  },
  methods: {
    insertTag(tag) {
      this.content += tag;
    },
    submitForm() {
    const formData = {
      name: this.name,
      email: this.email,
      homepage: this.homepage,
      content: this.content,
    };

    axios
      .post("/api/comments", formData)
      .then((response) => {
        console.log("Server response:", response.data);
        this.name = "";
        this.email = "";
        this.homepage = "";
        this.content = "";

        this.$root.$refs.commentsComponent.fetchComments();
      })
      .catch((error) => {
        console.error("Error:", error);
      });
    },
  },
};
</script>
