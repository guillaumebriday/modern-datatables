import path from 'path'
import { defineConfig } from 'vite'
import vue from "@vitejs/plugin-vue"
import { brotliCompressSync } from "zlib"
import gzipPlugin from "rollup-plugin-gzip"

export default defineConfig({
  plugins: [
    vue(),
    // Create gzip copies of relevant assets
    gzipPlugin(),
    // Create brotli copies of relevant assets
    gzipPlugin({
      customCompression: (content) => brotliCompressSync(Buffer.from(content)),
      fileName: ".br",
    }),
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
