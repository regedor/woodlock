# Woodlock


Woodlock is an authentication and user management engine using *devise* and *active admin*.

This project rocks and uses MIT-LICENSE.

### Instructions

* Add to Gemfile:

```
#!ruby

gem 'woodlock', git: 'https://itmiguelfernandes@bitbucket.org/itmiguelfernandes/woodlock.git'

group :development, :test do
  gem 'thin'
end
```
* `bundle install`

* `rake railties:install:migrations`

* `rake db:migrate`

* Define `root_path`

* Add logo file "woodlock-logo.png" to public folder (maximum width/height: 300x48)

* Add background image "woodlock-background.jpg" to public folder
