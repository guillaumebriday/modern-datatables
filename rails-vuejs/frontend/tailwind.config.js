/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './index.html',
    './src/**/*.{js,ts,vue}'
  ],
  plugins: [
    require('@tailwindcss/forms')
  ]
}
