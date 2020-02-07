How to install
--------------

1. Install Ruby
2. Install the Bundle gem with
```shell
$ gem install bundler
```
3. Use bundler to install all dependencies
```shell
$ cd automation-poc
$ bundle install
```

How to run the specifications
-----------------------------

```shell
$ cucumber features
```
.
├── config <-- Configuration files (empty for now).
├── cucumber.yml <-- Configuration for Cucumber execution profiles.
├── features <-- Feature files
│   ├── search.feature
│   ├── shopping_cart.feature
│   ├── step_definitions <-- Code that automates the Gherkin steps in the features.
│   │   ├── search_steps.rb
│   │   └── shopping_cart_steps.rb
│   └── support
│       ├── api_client.rb <-- Helper class to interact with the API
│       ├── env.rb <-- Cucumber environment configuration.
│       ├── hooks.rb <-- Hooks - Methods that run before/after every scenario.
│       ├── matchers.rb <-- Custom RSpec matchers to improve expressivenes in step definitions.
│       └── pages <-- Page object classes.
│           ├── cart_page.rb
│           ├── home_page.rb
│           ├── product_page.rb
│           └── search_results_page.rb
├── Gemfile <-- Contains dependencies for the project.
├── Gemfile.lock <-- How dependencies were resolves successfully last time.
├── Rakefile <-- Configuration for rake to run this as a Cucumber task.
└── README.md <-- This file.
