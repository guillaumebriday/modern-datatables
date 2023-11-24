import path from 'path'
import { defineConfig } from 'vite'
import vue from "@vitejs/plugin-vue"

export default defineConfig({
  plugins: [
    vue()
  ],

 server: {
   proxy: {
     // with options: http://localhost:5173/api-> http://localhost:3000/api
     '/api': {
       target: 'http://localhost:3000'
     },
   }
 },

  // output built static files to Rails's public dir.
  // note the "build" script in package.json needs to be modified as well.
  build: {
    outDir: '../public'
  },

  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
})
