<template>
  <NuxtLayout>
    <header class="header-tentang">
      <h1>Tentang Kami</h1>
    </header>
    <main class="main-tentang">
      <div class="card-tentang">
        <h1>"Selamat datang di Ruang Enchep Cooking"</h1>
        <div class="card-tentang-text">
          <div class="kiri">
            <p>Enchep Kooking adalah sebuah website yang sangat berguna bagi para pecinta kuliner, karena di
              dalamnya terdapat banyak sekali informasi dan tutorial tentang resep masakan yang mudah diikuti dan
              hasilnya pun sangat lezat.<br><br>

              Enchep kooking dibuat untuk mempermudah ibu atau anak-anak remaja yang ingin belajar memasak dengan
              mengikuti resep-resep yang ada didalam website ini.
              Yuk bisa masak dari sekarang, Salurkan <b>“HOBBYMU”</b>.
            </p>
          </div>
          <div class="kanan">
            <p>Enchep kooking juga membuka sebuah form untuk moms atau girls/boys yang ingin menyalurkan Resep makasakan
              ala-ala rumahan dan modern/tradisional.</p>
            <div class="daft">
              <h3>Yuk, daftarkan dirimu sebagai penyalur resep!</h3>
              <NuxtLink class="daft-tomb" to="/iam/register">Daftar Sekarang</NuxtLink>
            </div>
          </div>
        </div>
      </div>
    </main>
  </NuxtLayout>
</template>
  
<style>
header {
  background: linear-gradient(rgba(15, 23, 43, .9), rgba(15, 23, 43, .9)), url("~/assets/img/chef.jpg");
  background-size: cover;
}
</style>
  
<script setup>
useHead({
  title: 'Tentang - Enchep Cooking'
})
</script>