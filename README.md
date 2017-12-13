# VVV Template

A simple VVV starting template that allows you to create development environment easily by adding configurations in ```vvv-custom.yml```.

I've created this to separate the VVV basic template requirements for adding new environment onto your actual WordPress project repository.

### Overview

* Based on **VVV Version [2.1.0](https://github.com/Varying-Vagrant-Vagrants/VVV/releases/tag/2.1.0)**
* It clones your WordPress project repository in ```public_html``` folder
* Creates new database automatically when it is not existing yet

# Configurations

### Basic configuration

Use this configuration to your ```vvv-custom.yml```.

```
  dev-example:
    repo: https://github.com/pkvillanueva/vvv-template.github
    hosts:
      - dev-example.test
      - dev-example.local
    custom:
      project_repo: link_to_your_repo
      db_name: dev_example
```

### Site custom config

All available settings inside ```custom``` config.

| Setting      | Value             | Description                                 |
| ------------ | ----------------- | ------------------------------------------- |
| project_repo | link_to_your_repo | Specify your WP project repository.         |
| db_name      | dev_example       | Your database name to create on initialize. |
