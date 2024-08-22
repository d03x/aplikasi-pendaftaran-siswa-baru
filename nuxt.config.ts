// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: false },
  modules: ["@nuxt/ui"],
  app: {
    rootAttrs: {
      id: "root",
    },
    buildAssetsDir: "skidev",
    head: {
      title: "dadandev",
    },
  },
  compatibilityDate: "2024-08-22",
  runtimeConfig: {
    database: {
      host: "localhost",
      user: "root",
      password: "",
      database: "",
    },
  },
});
