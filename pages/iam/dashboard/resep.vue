<template>
        <main class="profil-main">
        <div class="mid" style="margin-top: 140px;">
            <h2><NuxtLink to="/iam/dashboard/buat-resep">Buat resep <span>+</span></NuxtLink></h2>
        </div>
        <template v-for="resep in reseps">
            <div class="bot" v-if="resep.author == nama_lengkap">
                <div class="kiri">
                    <div class="prfl">
                        <img src="~/assets/img/profil2.png" alt="">
                        <p style="line-height: 1.5rem;"><b>{{ nama_lengkap }}</b><br><i>{{ profile.email }}</i></p>
                    </div>
                    <h2><NuxtLink :to="`/iam/dashboard/reseps/${resep.id}`">{{ resep.judul }} (Klik untuk mengedit)</NuxtLink></h2>
                    <p>Dibuat/diperbarui: {{ formatDate(resep.created_at) }}</p>
                </div>
                <div class="kanan">
                    <img :src="`${resep.foto}`" alt="">
                </div>
            </div>
        </template>
    </main>
</template>

<script>
import { format } from 'date-fns'
import idLocale from 'date-fns/locale/id'

export default {
  data() {
    return {
      date: '2023-05-05'
    }
  },
  methods: {
    formatDate(date) {
      const formattedDate = format(new Date(date), 'dd MMMM yyyy', { locale: idLocale })
      const formattedTime = format(new Date(date), 'HH:mm', { locale: idLocale })
      return `${formattedDate} - ${formattedTime}`
    }
  }
}
</script>

<script setup>

const profile = {
  id: "",
  firstName: "",
  lastName: "",
  email: "",
}

const attrs = useAttrs()
profile.id = attrs.profile.id
profile.firstName = attrs.profile.firstName
profile.lastName = attrs.profile.lastName
profile.email = attrs.profile.email

const nama_lengkap = profile.firstName+" "+profile.lastName;

const reseps = ref(null)
reseps.value = await getReseps()

async function getReseps() {
    return await $fetch('/api/reseps')
}

useHead({
  title: 'Resep Anda - Enchep Cooking'
})
</script>