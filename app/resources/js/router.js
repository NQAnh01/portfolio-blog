import { createRouter, createWebHistory } from "vue-router";
import Home from "@/pages/Home.vue";
import PostDetail from "@/pages/PostDetail.vue";
import CreatePost from "@/pages/CreatePost.vue";

const routes = [
    { path: "/", component: Home },
    { path: "/posts/:id", component: PostDetail },
    { path: "/create", component: CreatePost },
];

export default createRouter({
    history: createWebHistory(),
    routes,
});
