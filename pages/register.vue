<script setup lang="ts">

useHead({
  title: "Daftar Akun"
})
definePageMeta({
  layout: false,
})
const genders = [
  {
    name: "Laki Laki",
    value: "L"
  },
  {
    name: "Perempuan",
    value: "P"
  }
];
const loading = useLoading();
function register(event: Event) {
  loading.value = false;
  event.preventDefault();
  const finalize = Object.fromEntries(new FormData(event.target as HTMLFormElement).entries());
  const response = $fetch('/api/v1/register', {
    method : "POST",
    body: finalize,
    headers: {
      Accept: 'application/json'
    }
  })
}



</script>

<template>
  <div>
    <div class="max-w-md my-10 shadow mx-auto">
      <u-card>
        <div class="mb-5 text-gray-600">
          <h2 class="font-semibold text-lg">Daftar Akun PPDB</h2>
          <p class="text-sm">
            Silahkan daftar untuk melakukan pendaftaran
          </p>
        </div>
        <form @submit="register" action="" class="space-y-4">
          <div class="lg:flex space-y-4 lg:space-y-0 items-center gap-3">
            <UInput :disabled="loading" name="nisn" type="number" size="sm" placeholder="NISN"
              icon="i-heroicons-credit-card" />
            <UInput :disabled="loading" name="nik" type="number" size="sm" placeholder="NIK"
              icon="i-heroicons-credit-card" />
          </div>
          <UInput :disabled="loading" name="nama" size="sm" placeholder="Nama Lengkap" icon="i-heroicons-user" />

          <div>
            <UInput :disabled="loading" name="email" type="email" size="sm" placeholder="Alamat Email"
              icon="i-heroicons-envelope" />
            <span class="text-xs text-gray-500 leading-none tracking-tighter">Gunakan GMAIL agar lebih mudah</span>
          </div>
          <USelect :disabled="loading" name="jenisKelamin" icon="i-heroicons-user-group" :options="genders"
            option-attribute="name" size="sm" placeholder="Gender" />
          <UInput :disabled="loading" name="nomorTelepon" type="telp" size="sm" placeholder="Nomor telepon"
            icon="i-heroicons-phone" />

          <u-alert color="orange" variant="subtle"
            description="Kata sandi dan info login akan di kirim via email yang di daftarkan. Pasikan email anda aktif dan gunakan GMAIL" />
          <u-button :loading="loading" type="submit" block>Register</u-button>
          <u-button variant="outline" block>Sudah Punya Akun</u-button>
        </form>
      </u-card>
    </div>
  </div>
</template>
