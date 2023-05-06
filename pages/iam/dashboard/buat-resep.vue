<template>
    <main class="buat-main">
        <form action="">
            <h1>Buat Resep</h1>
            <div class="fg">
                <label for="">Judul Resep <span>*</span></label>
                <input v-model="judul" type="text">
            </div>
            <div class="fg">
                <label for="">Foto (url)<span>*</span></label>
                <input type="text" v-model="foto">
            </div>
            <div class="fg">
                <label for="">Bahan-bahan <span>*</span></label>
                <textarea required v-model="bahan" name="bahan"></textarea>
            </div>
            <div class="fg">
                <label for="">Langkah-langkah <span>*</span></label>
                <textarea required v-model="langkah" name="langkah"></textarea>
            </div>
            <div class="log-tom">
                <button type="button" @click.prevent="addResep(judul, foto, bahan, langkah)" class="submit">Buat Resep</button>
                <button class="batal" type="button" @click="navigateTo('/iam/dashboard/resep')">Batal</button>
            </div>
        </form>
    </main>
</template>

<script setup>
const profile = {
  id: "",
  firstName: "",
  lastName: "",
};

// Get profile passed through attributes
const attrs = useAttrs();
profile.id = attrs.profile.id;
profile.firstName = attrs.profile.firstName;
profile.lastName = attrs.profile.lastName;

const nama_lengkap = profile.firstName+" "+profile.lastName;

const foto = ref(null);

/**
 * @desc Add reseps
 * @param The fields of resep to add
 */
async function addResep(judul, foto, bahan, langkah) {
  await $fetch('/api/reseps', {
    method: 'POST',
    body: {
      author: nama_lengkap,
      judul,
      foto,
      bahan,
      langkah,
    }
  })

  await navigateTo('/iam/dashboard/resep')

}

useHead({
    title: "Buat Resep - Enchep Cooking"
})
</script>