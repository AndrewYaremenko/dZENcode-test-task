<template>
  <div
    class="modal fade"
    id="imageModal"
    role="dialog"
    aria-labelledby="imageModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button
            type="button"
            class="btn btn-danger"
            data-dismiss="modal"
            aria-label="Close"
            @click.prevent="closeModal('image')"
          >
            <span aria-hidden="true">&times;</span>
          </button>
          <a :href="modalImage" download="image.jpg" class="btn btn-primary"
            >Download</a
          >
        </div>
        <div class="modal-body text-center">
          <img :src="modalImage" alt="attachment" class="img-fluid mx-auto" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["modalImage"]),
  },
  methods: {
    closeModal(type) {
      if (type === "image") {
        $("#imageModal").modal("hide");
      }
    },
  },
};
</script>
