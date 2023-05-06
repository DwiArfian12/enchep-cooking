<template>
  <div>
    <main class="masuk">
        <div class="kiri">
            <img class="maskot" src="~/assets/img/Bbang2.png" alt="">
        </div>
        <div class="kanan">
            <form>
                <h1>Masuk</h1>
                <div class="fg">
                    <label for="">Email <span>*</span></label>
                    <input v-model="loginForm.email" type="email" id="floatingInput" placeholder="nama@contoh.com" autofocus>
                </div>
                <div class="fg">
                    <label for="">Kata Sandi <span>*</span></label>
                    <input v-model="loginForm.password" type="password" id="floatingPassword" placeholder="Password">
                </div>
                <p>Belum punya akun? <NuxtLink to="/iam/register">Daftar di sini</NuxtLink></p>
                <div class="log-tom">
                    <button class="submit" @click.prevent="tryLogin">Masuk</button>
                    <button class="batal" type="button" onclick="window.location.href='/';">Batal</button>
                </div>
            </form>
        </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { GoogleSignInButton, 
  type CredentialResponse,
} from "vue3-google-signin";
import { useIamProfileStore } from '@/stores/useIamProfileStore'

// Get necessary functions from useIam composable
const { login, loginWithGoogle } = useIam();
const allowGoogleAuth = useRuntimeConfig().public.iamAllowGoogleAuth === "true";
const iamStore = useIamProfileStore()

// These variables come from response from calling Nuxt IAM api
let loginError = ref(<{ message: "" } | null>null);

const loginForm = {
  email: "",
  password: "",
};

// Try to log user in
async function tryLogin() {
  const { status, error } = await login(loginForm.email, loginForm.password);
  

  // If error, log error and return
  if (status === 'fail'){
    loginError.value = error
    console.error(error); 
    return
  }
  
  // If successful, navigate to dashboard
  if (status === "success") navigateTo("/iam/dashboard");
}

// Handle Google login success
const handleGoogleLoginSuccess = async (response: CredentialResponse) => {
  const { credential } = response;
  let res = null;
  if (credential) res = await loginWithGoogle(credential);

  // Check for error
  if (res?.error) {
    loginError.value = res.error;
  } else {
    iamStore.setIsLoggedIn(true)    
    navigateTo("/user/");
  }
};

// Handle Google error event
const handleGoogleLoginError = () => {
  console.error("Login failed");
};

// If you're using the same version of Bootstrap in your whole app, you can remove the links and scripts below
useHead({
    title: "Masuk - Enchep Cooking"  
});
</script>
