<template>
  <div class="row">
    <div class="col-md-4 offset-md-4">
      <form action="" method="POST">
        <div class="mb-2">
          <label for="name" class="form-label">User Name</label>
          <input
            type="text"
            class="form-control"
            id="name"
            name="name"
            placeholder="User Name"
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
          />
        </div>
        <div class="mb-3">
          <label for="comment" class="form-label">Comment</label>
          <textarea
            class="form-control"
            id="comment"
            name="comment"
            rows="2"
            placeholder="Comment"
            v-model="commentText"
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
        <button type="submit" class="btn btn-primary">Comment</button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      commentText: "",
    };
  },
  methods: {
    insertTag(tag) {
      this.commentText += tag;
    },
  },
};
</script>
