<template>
    <div>
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
        <div class="container px-4 px-lg-5">
          <router-link class="navbar-brand" to="/">Clean Blog</router-link>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive">
            Menu <i class="fas fa-bars"></i>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto py-4 py-lg-0">
              <li class="nav-item"><router-link class="nav-link" to="/">Trang chủ</router-link></li>
              <li class="nav-item"><router-link class="nav-link" to="/create">Tạo bài viết</router-link></li>
            </ul>
          </div>
        </div>
      </nav>
  
      <!-- Header -->
      <header class="masthead" style="background-image: url('/template/clean-blog/assets/img/home-bg.jpg')">
        <div class="container position-relative px-4 px-lg-5">
          <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
              <div class="site-heading">
                <h1>My Blog</h1>
                <span class="subheading">Laravel API + Vue SPA</span>
              </div>
            </div>
          </div>
        </div>
      </header>
  
      <!-- Nội dung -->
      <main class="container px-4 px-lg-5">
        <router-view></router-view>
      </main>
  
      <!-- Footer -->
      <footer class="border-top py-4 text-center">
        <div class="container">
          <p class="text-muted">© 2025 - Blog with Laravel + Vue</p>
        </div>
      </footer>
    </div>
  </template>
  