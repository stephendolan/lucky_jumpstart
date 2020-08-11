# Lucky Jumpstart

This is a template project for web applications using [Lucky](https://luckyframework.org).

### How to use it?

- Click the big green "Use this template" button on the [GitHub Repository](https://stephendolan/lucky_jumpstart)
- Replace every instance of `my_app` with your application name, for example:
  - `mv src/my_app.cr src/{your_app}.cr`
  - `rg my_app | xargs sed -i '' s/my_app/{your_app}/g`

### Why use a template?

There are quite a few things I find myself adding to every Lucky application out of the box, and this serves as a bit of a better starting point than the default generated application.

### What's in the box?

#### Development

- A [DockerCompose](https://docs.docker.com/compose/) file for running your application database

#### Dependencies

- Up-to-date Crystal dependencies
- Up-to-date Yarn dependencies

#### CI/CD

- A Dockerfile that can run LuckyFlow specs

- A working GitHub Actions workflow with:

  - [Prettier](https://prettier.io/)
  - Crystal Format
  - [Ameba](https://github.com/crystal-ameba/ameba)
  - [Crystal Spec](https://crystal-lang.org/api/latest/Spec.html)

- A handy dandy [Dependabot](https://dependabot.com/) configuration file
