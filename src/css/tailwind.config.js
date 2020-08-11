const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  purge: [
    "./src/css/**/*.scss",
    "./src/pages/**/*.cr",
    "./src/components/**/*.cr",
    "./src/js/controllers/*.ts",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
    },
  },
  variants: {},
  plugins: [require("@tailwindcss/ui")],
};
