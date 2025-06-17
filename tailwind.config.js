module.exports = {
  content: [
    "./app/components/**/*",
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  safelist: [
    "alert-alert",
    "alert-error",
    "alert-success",
    "alert-info",
    "btn-alert",
    "btn-error",
    "btn-success",
    "btn-info",
  ],
};
