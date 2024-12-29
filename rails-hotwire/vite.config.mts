import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import { brotliCompressSync } from "zlib"
import gzipPlugin from "rollup-plugin-gzip"

export default defineConfig({
  plugins: [
    RubyPlugin(),
    // Create gzip copies of relevant assets
    gzipPlugin(),
    // Create brotli copies of relevant assets
    gzipPlugin({
      customCompression: (content) => brotliCompressSync(Buffer.from(content)),
      fileName: ".br",
    }),
  ],
})
