module.exports = {
  // proxy API requests to Rails during development
  devServer: {
    proxy: "http://localhost:3000"
  },

  // output built static files to Rails's public dir.
  // note the "build" script in package.json needs to be modified as well.
  outputDir: "../public",

  lintOnSave: false,

  // modify the location of the generated HTML file.
  // make sure to do this only in production.
  indexPath:
    process.env.NODE_ENV === "production"
      ? "../app/views/application.html.erb"
      : "index.html"
};
