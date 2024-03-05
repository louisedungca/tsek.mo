const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['"Nunito"', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        primary: '#00AFC7',
        secondary: '#FF7396',
        accentV1: '#FCCB30',      
        accentV2: '#00BEAE',
        accentV3: '#FF8048',
      },
      boxShadow: {
        "shadow__dark": "0 0.15rem 0.15rem 0 rgba(28, 25, 23, 0.85)",
      },
      fontSize: {
        fSize__header: "clamp(1rem, 0.7857rem + 1.1429vw, 2.2rem)",
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
