<template>
    <main class="buat-main">
      <template v-for="resep in reseps">
        <form v-if="resep.id == $route.params.id">
            <h1>Edit Resep</h1>
            <div class="fg">
                <label for="">Judul Resep <span>*</span></label>
                <input v-model="resep.judul" type="text">
            </div>
            <div class="fg">
                <label for="">Foto (url)<span>*</span></label>
                <input type="text" v-model="resep.foto">
            </div>
            <div class="fg">
                <label for="">Bahan-bahan <span>*</span></label>
                <textarea v-model="resep.bahan" name="bahan"></textarea>
            </div>
            <div class="fg">
                <label for="">Langkah-langkah <span>*</span></label>
                <textarea v-model="resep.langkah" name="langkah"></textarea>
            </div>
            <div class="log-tom">
              <button type="button" @click.prevent="editResep(resep.id, resep.author, resep.judul, resep.bahan, resep.langkah, resep.foto)" class="submit">Edit Resep</button>
              <button class="batal" type="button" @click="navigateTo('/iam/dashboard/resep')">Batal</button>
              <button type="button" @click="deleteResep(resep.id)" class="hapus">Hapus Resep</button>
            </div>
        </form>
      </template>
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

const reseps = ref(null)
reseps.value = await getReseps()

async function getReseps() {
    return await $fetch('/api/reseps')
}

/**
 * @desc Edit reseps
 * @param The fields of resep to edit
 */
async function editResep(a, b, c, d, e, f) {
  if(a && b && c && d && e && f)
    await $fetch('/api/reseps', {
      method: 'PUT',
      body: {
        id: a,
        author: b,
        judul: c,
        bahan: d,
        langkah: e,
        foto: f,
      }
    })

    await navigateTo('/iam/dashboard/resep')
}

/**
 * @desc Delete reseps
 */
 async function deleteResep(id) {

let deletedresepOrError = null

deletedresepOrError = await $fetch('/api/reseps', {
  method: 'DELETE',
  body: {
    id: id
  }
})

await navigateTo('/iam/dashboard/resep')

}

useHead({
  title: "Edit Resep - Enchep Cooking"
})
</script>