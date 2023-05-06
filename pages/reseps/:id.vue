<template>
    <NuxtLayout>
    <main class="main-resep">
        <template v-for="resep in reseps">
        <div class="card-resep" v-if="resep.id == $route.params.id">
            <div class="img" :style="{ backgroundImage: 'url(\''+resep.foto+'\')' }">
                <h1>{{ resep.judul }}</h1>
                <p>Oleh: {{ resep.author }}</p>
            </div>
            <div class="bahan">
                <h3>Bahan:</h3>
                <ul>
                    <p>{{ resep.bahan }}</p>
                </ul>
            </div>
            <div class="langkah">
                <h3>Cara Membuat {{ resep.judul }}:</h3>
                <ol>
                    <p>{{ resep.langkah }}</p>
                </ol>
            </div>
            <a class="daft-tomb" href="/resep">Lihat Resep Lainnya</a>
        </div>
    </template>
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
  title: "Detail Resep - Enchep Cooking"
})
</script>