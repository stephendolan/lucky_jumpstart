# ☘️ Lucky Jumpstart

This is a template project for web applications using [Lucky](https://luckyframework.org).

![Crystal CI](https://github.com/stephendolan/lucky_jumpstart/workflows/Crystal%20CI/badge.svg)

### How to use it?

- Click [this link](https://github.com/stephendolan/lucky_jumpstart/generate)
- Replace every instance of `my_app` with your application name, for example:
  - `mv src/my_app.cr src/your_app.cr`
  - `rg my_app -l | xargs sed -i '' 's/my_app/your_app/g'`
  - You can also simply run `./script/rename_template_app your_app`
- Run `./script/setup`
- Run `docker-compose up`
- Run `lucky dev`

### Why use a template?

There are quite a few things I find myself adding to every Lucky application out of the box, and this serves as a bit of a better starting point than the default generated application.

### What's in the box?

#### Development

- 🐳 &nbsp; A [DockerCompose](https://docs.docker.com/compose/) file for running your application database

#### Dependencies

- 💎 &nbsp; Up-to-date Crystal dependencies
- 🧶 &nbsp; Up-to-date Yarn dependencies

#### Tooling

- 😽 &nbsp; [TailwindCSS](https://tailwindcss.com) for better styling
- 😻 &nbsp; [TailwindUI](https://tailwindui.com) for fancy components
- 🎉 &nbsp; [StimulusJS](https://stimulusjs.org) for JavaScript sprinkles
- 🚀 &nbsp; [TypeScript](https://typescript.org) for keeping JavaScript cleaner

#### CI/CD

- 🐳 &nbsp; A Dockerfile that can run LuckyFlow specs
- 🤖 &nbsp; A handy dandy [Dependabot](https://dependabot.com/) configuration file

- A working GitHub Actions workflow with:

  - 💃 &nbsp; [Prettier](https://prettier.io/)
  - 💎 &nbsp; Crystal Format
  - 🦠 &nbsp; [Ameba](https://github.com/crystal-ameba/ameba)
  - 👓 &nbsp; [Crystal Spec](https://crystal-lang.org/api/latest/Spec.html)
