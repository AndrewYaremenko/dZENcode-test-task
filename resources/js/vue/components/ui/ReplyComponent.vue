<template>
  <div v-for="comment in comments" :key="comment.id">
    <div class="col-md-9 alert alert-primary">
      <div>
        <strong>Reply to #{{ comment.parent_id }}</strong>
      </div>
      <hr />
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
        <div v-if="comment.homepage">
          <a :href="comment.homepage">{{ comment.homepage }}</a>
        </div>
      </div>
      <hr />
      <p v-html="filterAndAllowHtml(comment.content)"></p>

      <div>
        <div v-if="comment.attachment_type === 'image'">
          <a @click="openImageModal(comment.attachment)">
            <img
              :src="comment.attachment"
              alt="attachment"
              class="attachmentImage"
            />
          </a>
        </div>

        <div v-else-if="comment.attachment_type === 'text/plain'">
          <a
            @click.prevent="openTextModal(comment.attachment)"
            href=""
            class="attachmentText"
          >
            Attachment text file (open)
          </a>
        </div>
      </div>

      <div class="d-flex justify-content-end">
        <button class="btn btn-primary" @click="setReplyId(comment.id)">
          Comment it
        </button>
      </div>
    </div>
    <ReplyComponent
      v-if="comment.child_comments && comment.child_comments.length > 0"
      :comments="comment.child_comments"
    ></ReplyComponent>
  </div>
</template>

<script>
import { mapState, mapMutations, mapGetters } from "vuex";

import DOMPurify from "dompurify";
export default {
  props: {
    comments: Array,
  },
  computed: {
    ...mapState(["replyId"]),
    ...mapGetters(["modalImage", "modalTextContent", "modalTextLink"]),
  },
  methods: {
    ...mapMutations([
      "setReplyId",
      "setModalImage",
      "setModalTextContent",
      "setModalTextLink",
    ]),

    openTextModal(fileUrl) {
      axios
        .get(fileUrl)
        .then((response) => {
          const fileContent = response.data;

          this.setModalTextContent(fileContent);
          this.setModalTextLink(fileUrl);

          $("#textModal").modal("show");
        })
        .catch((error) => {
          console.error(error);
        });
    },

    openImageModal(imageSrc) {
      this.setModalImage(imageSrc);
      $("#imageModal").modal("show");
    },

    filterAndAllowHtml(content) {
      const allowedTags = ["strong", "i", "a", "code"];
      const allowedAttributesForA = ["href", "title"];

      const cleanHtml = DOMPurify.sanitize(content, {
        ALLOWED_TAGS: allowedTags,
        ALLOWED_ATTR: allowedAttributesForA,
      });

      return cleanHtml;
    },
  },
};
</script>
