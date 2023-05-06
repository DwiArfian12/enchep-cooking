<template>
  <NuxtLayout>
    <header class="header-resep">
      <h1>Menu Resep</h1>
      <form>
        <img src="~/assets/img/search.png" alt="">
        <input id="search" type="text" v-model="searchQuery">
      </form>
    </header>
    <main class="main-resep">
      <div class="cards">
        <div class="card" v-for="resep in filteredReseps" :key="resep.id">
          <img :src="`${resep.foto}`" alt="">
          <div class="card-text">
            <h2>{{ resep.judul }}</h2>
            <ul>
              <p>{{ resep.bahan }}</p>
            </ul>
            <NuxtLink class="selengkapnya" :to="`/reseps/${resep.id}`">Lihat Resep Selengkapnya</NuxtLink>
          </div>
        </div>
      </div>
    </main>
  </NuxtLayout>
</template>
<script setup>
import { ref, computed } from 'vue'

const reseps = ref(null)
const searchQuery = ref('')

reseps.value = await getReseps()

async function getReseps() {
  return await $fetch('/api/reseps')
}

const filteredReseps = computed(() => {
  if (!searchQuery.value) {
    // If search query is empty, return all reseps
    return reseps.value
  }
  // Otherwise, filter reseps based on search query
  return reseps.value.filter(resep =>
    resep.judul.toLowerCase().includes(searchQuery.value.toLowerCase())
  )
})

useHead({
  title: 'Resep - Enchep Cooking'
})
</script>