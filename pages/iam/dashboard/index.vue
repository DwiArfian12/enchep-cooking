<template>
    <header>
        <div class="kiri">
            <h1>Selamat Datang {{nama_lengkap}}!</h1>
            <h2>Publikasikan resep andalanmu di Enchep Cooking</h2>
        </div>
        <img class="head-img" src="~/assets/img/logo.png" alt="">
    </header>
    <main>
        <h1>Resep yang Anda Buat</h1>
        <div class="cards">
            <template v-for="resep in reseps">
                <div class="card" v-if="resep.author == nama_lengkap" @click="goToPage('/iam/dashboard/resep')">
                    <img :src="`${resep.foto}`" :alt="`${resep.foto}`">
                    <h2>{{ resep.judul }}</h2>
                </div>
            </template>
        </div>
    </main>
</template>

<script>
export default {
  methods: {
    goToPage(pageUrl) {
      this.$router.push(pageUrl)
    }
  }
}
</script>


<script setup>
const profile = {
  id: "",
  firstName: "",
  lastName: ""
}


const attrs = useAttrs()
profile.id = attrs.profile.id
profile.firstName = attrs.profile.firstName
profile.lastName = attrs.profile.lastName

const nama_lengkap = profile.firstName+" "+profile.lastName

const reseps = ref(null)
reseps.value = await getReseps()

async function getReseps() {
    return await $fetch('/api/reseps')
}

useHead({
  title: "Beranda User",  
});
</script>