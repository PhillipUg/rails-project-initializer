# Rails Project Initializer

Rails Project Initializer is a web application that provides a user-friendly interface for creating new Ruby on Rails projects with customized options.

## Features

- Generate a new Rails application with customized options.
- Selection for Rails version.
- Selection for Database type (PostgreSQL, MySQL, SQLite).
- Selection for Testing Framework (RSpec, Minitest).
- Selection for Styling (Tailwind, Bootstrap).
- Selection for JavaScript packager (Webpack, esbuild).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Ruby 3.2.2
- Rails 7.0.6
- PostgreSQL

### Installation

1. Clone the repository

```bash
git clone https://github.com/phillipug/rails-project-initializer.git
```

2. Change into the directory

```bash
cd rails-project-initializer
```

3. Install all dependencies

```bash
bundle install
```

4. Set up the database

```bash
rails db:create db:migrate
```

5. Start the Rails server

```bash
rails s
```

Visit `http://localhost:3000` to see the application in action.

## Running Tests

You can run the test suite using the following command:

```bash
rspec
```

## Contributing

We encourage you to contribute to Rails Project Initializer! Please check out the [Contributing to Rails Project Initializer guide](CONTRIBUTING.md) for guidelines about how to proceed.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments
- [Spring Initializr](https://start.spring.io/)
- Ruby on Rails community
- Everyone who has contributed to this project
