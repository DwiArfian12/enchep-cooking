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
        <h1>Food</h1>
        <div class="cards">
            <div class="card" v-for="resep in reseps">
                <img src="~/assets/img/tongseng.jpg" alt="">
                <h2>{{ resep.judul }}</h2>
            </div>
        </div>
    </main>
  </NuxtLayout>
</template>

<script setup>
const reseps = ref(null)
reseps.value = await getReseps()

async function getReseps() {
    return await $fetch('/api/reseps')
}

useHead({
  title: "Beranda User",  
});
</script>