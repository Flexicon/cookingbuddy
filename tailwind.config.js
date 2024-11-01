import daisyui from 'daisyui';

module.exports = {
  plugins: [daisyui],
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
  ],
};
