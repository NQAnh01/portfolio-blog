import './bootstrap';
import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";

// Bootstrap
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min.js";

// Clean Blog custom CSS
import '@/css/styles.css'

createApp(App).use(router).mount("#app");