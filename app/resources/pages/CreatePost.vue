<template>
    <div>
      <h1>✍️ Tạo bài viết mới</h1>
      <form @submit.prevent="createPost">
        <div>
          <label>Tiêu đề:</label><br>
          <input v-model="title" type="text" />
        </div>
        <div>
          <label>Nội dung:</label><br>
          <textarea v-model="content"></textarea>
        </div>
        <button type="submit">Lưu bài viết</button>
      </form>
  
      <p v-if="message" style="color: green">{{ message }}</p>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  import axios from 'axios'
  
  const title = ref('')
  const content = ref('')
  const message = ref('')
  
  async function createPost() {
    try {
      const res = await axios.post('http://localhost:8080/api/posts', {
        title: title.value,
        content: content.value
      })
      message.value = res.data.message
      title.value = ''
      content.value = ''
    } catch (err) {
      console.error('Lỗi tạo bài viết:', err)
    }
  }
</script>
  