<template>
  <main class="buat-main">
        <form action="">
            <h1>Ganti Password</h1>
            <div class="fg">
                <label for="">Password Saat Ini <span>*</span></label>
                <input type="password" v-model="profile.currentPassword">
            </div>
            <div class="fg">
                <label for="">Password Baru <span>*</span></label>
                <input type="password" v-model="profile.newPassword">
            </div>
            <div class="fg">
                <label for="">Konfirmasi Password Baru <span>*</span></label>
                <input type="password" v-model="profile.confirmNewPassword">
            </div>
            <p style="color: red">Hapus akun? <NuxtLink style="color: red; cursor: pointer;" @click.prevent="deleteMyAccount()">Klik Di sini</NuxtLink></p>
            <div class="log-tom">
                <button type="button" class="submit" @click.prevent="updateMyProfileWithPassword()">Perbarui Password</button>
                <button class="batal" type="button" @click="navigateTo('/iam/dashboard/profile')">Kembali</button>
            </div>
        </form>
    </main> 
</template>

<script setup>
import { useIamProfileStore } from '@/stores/useIamProfileStore'

const iamStore = useIamProfileStore()
const { updateProfile, deleteAccount } = useIam();

const updateSuccessful = ref(false);
let profileError = ref(null);
let deleteError = ref(null);

// Some profile values with added ones
const profile = {
  uuid: "",
  firstName: "",
  lastName: "",
  currentPassword: "",
  newPassword: "",
  confirmNewPassword: "",
  csrfToken: "",
};

// Get profile passed through attributes
const attrs = useAttrs();
profile.uuid = attrs.profile.uuid;
profile.firstName = attrs.profile.firstName;
profile.lastName = attrs.profile.lastName;

// Csrf token should be part of profile
const csrfToken = attrs.profile.csrfToken;

// Attempt to update user profile with password
async function updateMyProfileWithPassword() {
  // Front end password validation
  if (
    !profile.currentPassword ||
    !profile.newPassword ||
    !profile.confirmNewPassword
  ) {
    const allPasswordsError = {
      message: "All passwords must be supplied",
    };
    console.log("error: ", allPasswordsError);
    profileError.value = allPasswordsError;
    return;
  }

  // Confirm password front end validation
  if (profile.newPassword !== profile.confirmNewPassword) {
    const confirmPasswordError = {
      message: "New password does not match confirm password",
    };
    console.log("error: ", confirmPasswordError);
    profileError.value = confirmPasswordError;
    return;
  }

  const { error } = await updateProfile({
    uuid: profile.uuid,
    currentPassword: profile.currentPassword,
    newPassword: profile.newPassword,
    confirmNewPassword: profile.confirmNewPassword,
    csrfToken: csrfToken,
  });

  // If error, display error
  if (error) {
    console.log("error: ", error);
    profileError.value = error;
    return;
  }

  updateSuccessful.value = true;
}

// Attempt to delete user account
async function deleteMyAccount() {
  const { error } = await deleteAccount(profile.uuid, csrfToken);

  // If error, show error
  if (error) {
    deleteError.value = error;
    return;
  }
  
  // Clear store variables
  iamStore.setIsLoggedIn(false)
  iamStore.clearProfile()

  // Navigate to register
  navigateTo("/iam/register");
}
</script>

<style scoped>
.iam-password-input {
  min-width: 180px;
}
</style>
