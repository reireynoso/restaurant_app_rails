# Restaurant App API

* The API for the Welp, Restaurant App.
* The API consists of 5 domain models with `has_many` and `belongs_to` associations.
* Sample data was pulled from a network request in Grubhub.
* The [repository](https://github.com/reireynoso/restaurant_app_react) to the client-side.
* The deployed application can be found [here](https://restaurant-client-react.herokuapp.com/home).
* Here is the link to the [demo](https://www.youtube.com/watch?v=1cgreYWLC1E).

# Getting Started
Before setting up, make sure Ruby, Rails and Postgresql have to be installed on your computer. 

## Prerequisites
If it is not installed, go in your terminal, and follow the steps:

1. Install Homebrew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

2. Install Ruby

`brew install ruby`

3. Install Rails

`gem install rails`

4. Install PostgreSQL

`brew install postgresql`

## Setup

From your terminal,

1. Clone the repo and `cd` into the folder
2. Install dependencies with `bundle install`
3. Create migrations, migrate, and seed:

```
    rails db:create
    rails db:migrate
    rails db:seed
```
4. Launch the server with `rails s`

# Built With
Ruby on Rails 

# Tools
* Rack Cors
* Active Model Serializers
* Active Record
* BCrypt
* JSON Web Tokens
* Cloudinary (photo uploads)
* Figaro (environment variables)

# Authors
Reinald Reynoso

