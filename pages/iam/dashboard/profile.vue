<template>
  <main class="buat-main">
        <form action="">
            <h1>Profil</h1>
            <div class="fg">
                <label for="">Nama Depan</label>
                <input type="text" v-model="profile.firstName">
            </div>
            <div class="fg">
                <label for="">Nama Belakang</label>
                <input type="text" v-model="profile.lastName">
            </div>
            <div class="fg">
                <label for="">Email</label>
                <input type="email" v-model="profile.email">
            </div>
            <!-- <div class="fg">
                <label for="">Foto Profil</label>
                <input type="file">
            </div> -->
            <p>Ingin ganti password? <NuxtLink to="/iam/dashboard/settings">Klik Di sini</NuxtLink></p>
            <div class="log-tom">
                <button type="button" class="submit" @click.prevent="updateMyProfile()">Perbarui Profil</button>
                <button class="batal" type="button" @click="navigateTo('/iam/dashboard/')">Kembali</button>
            </div>
        </form>
    </main> 
</template>

<script setup>
const emit = defineEmits(["profileUpdate"]);

const { updateProfile } = useIam();
const updateSuccessful = ref(false);
let profileError = ref(null);

// Some profile values
const profile = {
  uuid: "",
  firstName: "",
  lastName: "",
  email: "",
};

// Get profile passed through attributes
const attrs = useAttrs();
profile.uuid = attrs.profile.uuid;
profile.firstName = attrs.profile.firstName;
profile.lastName = attrs.profile.lastName;
profile.email = attrs.profile.email;

// Csrf token should be part of profile
const csrfToken = attrs.profile.csrfToken;

// Attempt to update user profile
async function updateMyProfile() {
  if (
    profile.firstName === attrs.profile.firstName &&
    profile.lastName === attrs.profile.lastName
  )
    return;

  // Object with updatable values
  const values = {
    uuid: profile.uuid,
    firstName: profile.firstName,
    lastName: profile.lastName,
    csrfToken: csrfToken,
  };

  const { error, data } = await updateProfile(values);

  // If error, display error
  if (error) {
    console.log("error: ", error);
    profileError.value = error;
    return;
  }

  updateSuccessful.value = true;

  emit("profileUpdate");
}
</script>
