import './bootstrap';
import { createApp } from 'vue';
import App from './vue/AppComponent.vue';
import store from './vue/store/store';

const app = createApp(App);
app.use(store);
app.mount("#app");