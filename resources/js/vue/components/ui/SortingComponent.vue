<template>
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
</template>

<script>
export default {
  methods: {
    sortBy(field) {
      this.$emit("sortBy", field);
    },
  },
  emits: ["sortBy"],
};
</script>