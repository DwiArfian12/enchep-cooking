<template>
  <div>
    <main class="daftar">
        <div class="kiri">
            <form>
                <h1>Daftar</h1>
                <div class="fg">
                    <label for="">Nama Depan <span>*</span></label>
                    <input v-model="registerForm.firstName" type="text" id="floatingFirstName" placeholder="Depan" autofocus>
                </div>
                <div class="fg">
                    <label for="">Nama Belakang <span>*</span></label>
                    <input  v-model="registerForm.lastName" type="text" id="floatingLastName"  placeholder="Belakang">
                </div>
                <div class="fg">
                    <label for="">Email <span>*</span></label>
                    <input v-model="registerForm.email" type="email" id="floatingEmail" placeholder="nama@contoh.com">
                </div>
                <div class="fg">
                    <label for="">Kata Sandi <span>*</span></label>
                    <input v-model="registerForm.password" type="password" id="floatingPassword" placeholder="Kata Sandi">
                </div>
                <p class="mt-2"><input type="checkbox" v-model="acceptTerms" /> Terima 
                <NuxtLink class="text-decoration-none" to="/iam/register"> syarat & ketentuan</NuxtLink></p>    
                <p>Sudah punya akun? <NuxtLink to="/iam/login">Masuk di sini</NuxtLink></p>
                <div class="log-tom">
                    <button type="button" class="submit" @click.prevent="tryRegister">Buat Akun</button>
                    <button class="batal" type="button" onclick="window.location.href='/';">Batal</button>
                </div>
            </form>
        </div>
        <div class="kanan">
            <img class="maskot" src="~/assets/img/Sulis2.png" alt="">
        </div>
    </main>
  </div>
</template>

<script setup>
const { register } = useIam();
const verifyRegistrations =
  useRuntimeConfig().public.iamVerifyRegistrations === "true";

// Error and success flags
let registerError = ref(null);
let registerSuccess = ref(null);

// Flag for terms and conditions
const acceptTerms = ref(false);

// Object to hold registration data
const registerForm = {
  firstName: "",
  lastName: "",
  email: "",
  password: "",
};

// Attempt to register user
async function tryRegister() {
  // Check terms and conditions checkbox
  if (!acceptTerms.value) {
    registerError.value = {
      message: "You must accept terms and conditions",
    };
    return;
  }

  // Send registration data
  const { status, error } = await register(
    registerForm.firstName,
    registerForm.lastName,
    registerForm.email,
    registerForm.password
  );

  // If we get an error
  if (error) {
    console.log("error: ", error);
    registerError.value = error;
  }

  // If successful, show success message, wait, then navigate to login page
  if (status === "success") {
    registerSuccess.value = true;
    setTimeout(() => { navigateTo("/iam/login"); }, 1000);
  }
}

useHead({
  title: "Daftar - Enchep Cooking",  
});
</script>