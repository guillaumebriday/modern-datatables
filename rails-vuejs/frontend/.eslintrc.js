// https://eslint.org/docs/user-guide/configuring

module.exports = {
  root: true,
  parser: "vue-eslint-parser",
  parserOptions: {
    parser: "@babel/eslint-parser",
    sourceType: "module"
  },
  env: {
    browser: true,
    node: true,
    es6: true
  },
  // https://github.com/standard/standard/blob/master/docs/RULES-en.md
  extends: [
    'standard',
    'plugin:vue/recommended'
  ],
  // required to lint *.vue files
  plugins: [
    'vue'
  ],
  // add your custom rules here
  rules: {
    'vue/multi-word-component-names': 'off'
  }
}
