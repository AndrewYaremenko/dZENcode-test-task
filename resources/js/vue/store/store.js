import { createStore } from 'vuex';

const store = createStore({
    state: {
        replyId: null,
    },
    mutations: {
        setReplyId(state, id) {
            state.replyId = id;
        },
    },
    actions: {
    },
    getters: {
        replyId: state => state.replyId,
    },
});

export default store;