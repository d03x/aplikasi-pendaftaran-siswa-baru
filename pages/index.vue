<script setup lang="ts">
useHead({
  title: "Index Page"
})
definePageMeta({
  layout: false,
})

const { data: users, status } = await useLazyAsyncData(() => $fetch('/api/v1/users'))
</script>

<template>
  <NuxtLink to="register">Register</NuxtLink>
  <div class="p-4" v-if="status == 'success'">
    <UTable  :rows="users.data">
       <template #expand={row}>
        <UKbd>
           CTRL + A
        </UKbd>
       </template>
    </UTable>
  </div>
  <div v-else class="flex items-center space-x-4">
    <USkeleton class="h-12 w-12" :ui="{ rounded: 'rounded-full' }" />
    <div class="space-y-2">
      <USkeleton class="h-4 w-[250px]" />
      <USkeleton class="h-4 w-[200px]" />
    </div>
  </div>
</template>

<style scoped></style>
