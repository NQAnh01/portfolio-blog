<template>
    <div>
      <div v-if="loading">⏳ Đang tải...</div>
  
      <div v-else>
        <div class="post-preview" v-for="post in posts" :key="post.id">
          <router-link :to="`/posts/${post.id}`">
            <h2 class="post-title">{{ post.title }}</h2>
            <h3 class="post-subtitle">{{ post.content.substring(0, 120) }}...</h3>
          </router-link>
          <p class="post-meta">
            Xuất bản ngày {{ formatDate(post.published_at) }}
          </p>
          <hr class="my-4" />
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue'
  import axios from 'axios'
  
  const posts = ref([])
  const loading = ref(true)
  
  onMounted(async () => {
    try {
      const res = await axios.get('http://localhost:8080/api/posts')
      posts.value = res.data.data ?? res.data
    } catch (err) {
      console.error("Lỗi load posts:", err)
    } finally {
      loading.value = false
    }
  })
  
  function formatDate(dateStr) {
    if (!dateStr) return 'Chưa xuất bản'
    return new Date(dateStr).toLocaleDateString('vi-VN')
  }
</script>
  