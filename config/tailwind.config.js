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
        fSize__xl: "clamp(1rem, 0.7368rem + 1.3158vw, 2rem)",
        fSize__main: "clamp(0.65rem, 0.4263rem + 1.1184vw, 1.5rem)",
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
