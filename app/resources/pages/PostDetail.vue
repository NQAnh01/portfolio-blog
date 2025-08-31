<template>
    <div>
      <h1>{{ post.title }}</h1>
      <p style="color: gray; font-size: 12px;">
        Xuất bản: {{ formatDate(post.published_at) }}
      </p>
      <div v-html="post.content"></div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue'
  import { useRoute } from 'vue-router'
  import axios from 'axios'
  
  const route = useRoute()
  const post = ref({})
  
  onMounted(async () => {
    const res = await axios.get(`http://localhost:8080/api/posts/${route.params.id}`)
    post.value = res.data
  })
  
  function formatDate(dateStr) {
    if (!dateStr) return 'Chưa xuất bản'
    return new Date(dateStr).toLocaleDateString('vi-VN')
  }
  </script>
  