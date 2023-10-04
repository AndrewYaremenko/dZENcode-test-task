import { createStore } from 'vuex';

const store = createStore({
    state: {
        replyId: null,
        modalImage: "",
        modalTextContent: "",
        modalTextLink: "",
    },
    mutations: {
        setReplyId(state, id) {
            state.replyId = id;
        },
        setModalImage(state, imageUrl) {
            state.modalImage = imageUrl;
        },
        setModalTextContent(state, textContent) {
            state.modalTextContent = textContent;
        },
        setModalTextLink(state, textLink) {
            state.modalTextLink = textLink;
        },
    },
    actions: {
    },
    getters: {
        replyId: state => state.replyId,
        modalImage: state => state.modalImage,
        modalTextContent: state => state.modalTextContent,
        modalTextLink: state => state.modalTextLink,
    },
});

export default store;
