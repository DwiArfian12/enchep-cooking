<template>
  <div>
    <nav id="navbar" class="nav-active">
      <div class="logo">
        <img src="~/assets/img/logo-w-text.png" alt="">
      </div>
      <div v-if="!iAmLoggedIn" class="menu">
        <ul>
          <li>
            <NuxtLink to="/">Beranda</NuxtLink>
          </li>
          <li>
            <NuxtLink to="/resep">Resep</NuxtLink>
          </li>
          <li>
            <NuxtLink to="/tentang">Tentang</NuxtLink>
          </li>
        </ul>
        <div class="auth">   
          <NuxtLink to="/iam/login">Masuk</NuxtLink>
            <p> | </p>
          <NuxtLink to="/iam/register">Daftar</NuxtLink>    
        </div>
      </div>
      <div v-else class="menu">
        <ul>
          <li>
            <NuxtLink to="/iam/dashboard">Beranda</NuxtLink>
          </li>
          <li>
            <NuxtLink to="/iam/dashboard/resep">Resep</NuxtLink>
          </li>
          <li>
            <NuxtLink to="/iam/dashboard/tentang">Tentang</NuxtLink>
          </li>
          <li>
            <NuxtLink to="/iam/dashboard/profile">Profil</NuxtLink>
          </li>
        </ul>
        <div class="auth">   
          <a @click="logMeOut">Logout</a>   
        </div>
      </div>
    </nav>
    <slot />
    <footer>
      <div class="atas">
        <div class="layanan">
          <h2>Layanan</h2>
          <ul>
            <li>
              <NuxtLink to="">Hubungi kami</NuxtLink>
            </li>
            <li>
              <NuxtLink to="">Bantuan</NuxtLink>
            </li>
            <li>
              <NuxtLink to="">Author</NuxtLink>
            </li>
            <li>
              <NuxtLink to="">Komunitas</NuxtLink>
            </li>
          </ul>
        </div>
        <div class="jelajahi">
          <h2>Jelajahi</h2>
          <ul>
            <li>
              <NuxtLink to="">Beranda</NuxtLink>
            </li>
            <li>
              <NuxtLink to="">Resep</NuxtLink>
            </li>
            <li>
              <NuxtLink to="">Tentang</NuxtLink>
            </li>
            <li>
              <NuxtLink to="">Masuk</NuxtLink>
            </li>
            <li>
              <NuxtLink to="">Daftar</NuxtLink>
            </li>
          </ul>
        </div>
        <div class="ikuti">
          <h2>Ikuti kami</h2>
          <div class="items sosmed">
            <div class="item">
              <img src="~/assets/img/instagram.png" alt="">
              <div class="item-text">
                <h3>Instagram</h3>
                <p>
                  <NuxtLink to="https://instagram.com/gloriamar2003" target="_blank">@gloriamar2003</NuxtLink>
                </p>
              </div>
            </div>
            <div class="item">
              <img src="~/assets/img/twitter.png" alt="">
              <div class="item-text">
                <h3>Twitter</h3>
                <p>
                  <NuxtLink to="">@enchepcooking</NuxtLink>
                </p>
              </div>
            </div>
            <div class="item">
              <img src="~/assets/img/whatsapp.png" alt="">
              <div class="item-text">
              <h3>WhatsApp</h3>
              <p>
                <NuxtLink to="">+62 85161648371</NuxtLink>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="bawah">
      <p class="copy">copyright &copy; - 2023 Enchep Cooking</p>
      <p>Made by Team GraSa</p>
    </div>
  </footer>
</div>
</template>

<script setup lang="ts">
import { useIamProfileStore } from '~/stores/useIamProfileStore'

// Pinia store for iamProfile
const iamStore = useIamProfileStore()
const { logout } = useIam();

const iAmLoggedIn = ref(false);
const showMenu = ref(false);

// Profile variables
const firstName = ref(<string|undefined>(undefined))
const lastName = ref(<string|undefined>(undefined))
const avatar = ref(<string|undefined>(undefined))

// Watch the iamProfile store
iamStore.$subscribe((mutation, state) => { 
  iAmLoggedIn.value = state.isLoggedIn
 
  // If profile values
  if (iAmLoggedIn.value) {
    const temp = iamStore.getProfile
    if (temp) {
      firstName.value = temp.firstName
      lastName.value = temp.lastName
      avatar.value = temp.avatar
    }
  }
})

/**
 * @Desc Toggle profile menu
 */
 async function toggleMenu() {
  showMenu.value = !showMenu.value;  
}

/**
 * @Desc Log user out
 */
async function logMeOut() {
  const { status } = await logout();
  if (status === "success") {
    
    // Clear store variables
    iamStore.setIsLoggedIn(false)
    iamStore.clearProfile()

    navigateTo("/iam/login");
  }
}
</script>