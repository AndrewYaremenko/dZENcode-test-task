<template>
  <div v-for="comment in comments" :key="comment.id">
    <div class="col-md-9 alert alert-secondary">
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
        <button
          class="btn btn-primary mx-2"
          v-if="comment.child_comments.length > 0"
          @click="toggleReplies(comment.id)"
        >
          {{ isReplyVisible(comment.id) ? "Hide reply" : "Show reply" }}
        </button>
        <button class="btn btn-success" @click="setReplyId(comment.id)">
          Comment it
        </button>
      </div>
    </div>
    <ReplyComponent
      v-if="
        isReplyVisible(comment.id) &&
        comment.child_comments &&
        comment.child_comments.length > 0
      "
      :comments="comment.child_comments"
      @openTextModal="openTextModal"
      @openImageModal="openImageModal"
    ></ReplyComponent>
  </div>

  <ImageModalComponent></ImageModalComponent>
  <TextModalComponent></TextModalComponent>
</template>

<script>
import { mapState, mapMutations, mapGetters } from "vuex";

import DOMPurify from "dompurify";
import ReplyComponent from "./ReplyComponent.vue";
import ImageModalComponent from "./ImageModalComponent.vue";
import TextModalComponent from "./TextModalComponent.vue";

export default {
  components: {
    ReplyComponent,
    ImageModalComponent,
    TextModalComponent,
  },
  computed: {
    ...mapState(["replyId"]),
    ...mapGetters(["modalImage", "modalTextContent", "modalTextLink"]),
  },
  props: {
    comments: Array,
  },
  data() {
    return {
      visibleReplyIds: [],
    };
  },
  methods: {
    ...mapMutations([
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

    toggleReplies(commentId) {
      const index = this.visibleReplyIds.indexOf(commentId);
      if (index === -1) {
        this.visibleReplyIds.push(commentId);
      } else {
        this.visibleReplyIds.splice(index, 1);
      }
    },

    isReplyVisible(commentId) {
      return this.visibleReplyIds.includes(commentId);
    },

    ...mapMutations(["setReplyId"]),

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

<style>
.attachmentImage {
  width: 25%;
  height: 25%;
}
</style>