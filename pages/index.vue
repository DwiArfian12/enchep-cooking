<template>
  <NuxtLayout>
    <header>
        <div class="kiri">
            <h1>Selamat Datang Di Ruang Enchep Cooking</h1>
            <h2>Enchep Cooking ada untuk membantu anda menemukan varian resep masakan rumahan</h2>
        </div>
        <img class="head-img" src="~/assets/img/logo.png" alt="">
    </header>
    <main>
        <h1>Resep Masakan</h1>
        <div class="cards">
            <div class="card" v-for="resep in reseps.slice(0, 4)">
                <img :src="`${resep.foto}`" alt="">
                <h2>{{resep.judul}}</h2>
                <NuxtLink class="selengkapnya" :to="`/reseps/${resep.id}`">Lihat Resep</NuxtLink>
            </div>
        </div>
    </main>
  </NuxtLayout>
</template>

<style>
  header {
    background: linear-gradient(rgba(15, 23, 43, .9), rgba(15, 23, 43, .9)), url("~/assets/img/chef.jpg");
    background-size: cover;
  }
</style>

<script setup>
  const reseps = ref(null)
  reseps.value = await getReseps()  

  
async function getReseps() {
  return await $fetch('/api/reseps')  
}
  useHead({
    title: 'Beranda - Enchep Cooking'
  })
</script>