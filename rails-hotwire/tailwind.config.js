/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('@tailwindcss/forms')
  ],
  theme: {
    extend: {
      boxShadow: {
        'outline-blue': `0 0 0 3px rgba(191, 219, 254, .5)`,
      }
    }
  }
}
