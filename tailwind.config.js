import daisyui from 'daisyui';

module.exports = {
  plugins: [daisyui],
  content: [
    './app/components/**/*.html.erb',
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
  ],
  safelist: [
    'alert-alert',
    'alert-error',
    'alert-success',
    'alert-info',
    'btn-alert',
    'btn-error',
    'btn-success',
    'btn-info',
  ]
};
