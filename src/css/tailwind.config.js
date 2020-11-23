const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  purge: [
    "./src/css/**/*.css",
    "./src/pages/**/*.cr",
    "./src/components/**/*.cr",
    "./src/js/controllers/*.ts",
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/aspect-ratio"),
  ],
};
