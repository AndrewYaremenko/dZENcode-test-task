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
            :class="errorClass.name"
            v-model="name"
          />
          <div class="invalid-feedback" v-if="errors.name">
            {{ errors.name[0] }}
          </div>
        </div>
        <div class="mb-2">
          <label for="email" class="form-label">Email</label>
          <input
            type="text"
            class="form-control"
            id="email"
            name="email"
            placeholder="Email"
            :class="errorClass.email"
            v-model="email"
          />
          <div class="invalid-feedback" v-if="errors.email">
            {{ errors.email[0] }}
          </div>
        </div>
        <div class="mb-2">
          <label for="homepage" class="form-label">Home page</label>
          <input
            type="text"
            class="form-control"
            id="homepage"
            name="homepage"
            placeholder="Home page"
            :class="errorClass.homepage"
            v-model="homepage"
          />
          <div class="invalid-feedback" v-if="errors.homepage">
            {{ errors.homepage[0] }}
          </div>
        </div>
        <div class="mb-3">
          <label for="content" class="form-label">Content</label>
          <p class="text-primary" v-if="replyId">
            Reply to comment #{{ replyId }}
            <a class="removeSelectId" href="" @click.prevent="clearReplyId"
              >❌</a
            >
          </p>
          <textarea
            class="form-control"
            id="content"
            name="content"
            rows="2"
            placeholder="Content"
            :class="errorClass.content"
            v-model="content"
          ></textarea>
          <div class="invalid-feedback" v-if="errors.content">
            {{ errors.content[0] }}
          </div>
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
import { mapGetters, mapMutations } from "vuex";
import axios from "axios";

export default {
  data() {
    return {
      name: "",
      email: "",
      homepage: "",
      content: "",
      errors: {},
      errorClass: {},
    };
  },
  computed: {
    ...mapGetters(["replyId"]),
  },
  methods: {
    ...mapMutations(["setReplyId"]),
    clearReplyId() {
      this.setReplyId(null);
    },
    insertTag(tag) {
      this.content += tag;
    },
    submitForm() {
      const formData = {
        name: this.name,
        email: this.email,
        homepage: this.homepage,
        content: this.content,
        parent_id: this.replyId,
      };

      axios
        .post("/api/comments", formData)
        .then((response) => {
          console.log("Server response:", response.data);
          this.name = "";
          this.email = "";
          this.homepage = "";
          this.content = "";
          this.errors = {};
          this.errorClass = {};
          this.setReplyId(null);

          this.$root.$refs.commentsComponent.fetchComments();
        })
        .catch((error) => {
          if (error.response && error.response.status === 422) {
            this.errors = error.response.data.errors;
            this.errorClass = {};
            for (const field in this.errors) {
              this.errorClass[field] = "is-invalid";
            }
          } else {
            console.error("Error:", error);
          }
        });
    },
  },
};
</script>

<style>
.removeSelectId {
  text-decoration: none;
}
</style>