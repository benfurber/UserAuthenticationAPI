# Suggested command for rails add
# > rails new . --template='./template.rb' --database=postgresql

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'rubocop', require: false
end

gem 'graphql'

bundle install

after_bundle do
  rails generate rspec:install

  rails_command "db:create"
  rails_command "db:migrate"

  get :init
  git add: "."
  git commit: %Q{ -m 'Complete basic Rails setup' }
end
