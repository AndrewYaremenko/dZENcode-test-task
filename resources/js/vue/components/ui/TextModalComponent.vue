<template>
  <div
    class="modal fade"
    id="textModal"
    role="dialog"
    aria-labelledby="textModalLabel"
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
            @click.prevent="closeModal('text')"
          >
            <span aria-hidden="true">&times;</span>
          </button>
          <a :href="modalTextLink" download="text.txt" class="btn btn-primary"
            >Download</a
          >
        </div>
        <div class="modal-body">
          <pre>{{ modalTextContent }}</pre>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters(["modalTextContent", "modalTextLink"]),
  },
  methods: {
    closeModal(type) {
      if (type === "text") {
        $("#textModal").modal("hide");
      }
    },
  },
};
</script>

<style>
.attachmentText {
  text-decoration: none;
}
</style>