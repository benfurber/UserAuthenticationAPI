def add_gems
  gem 'rspec-rails' --group "development,test"
  gem 'shoulda' --group "development,test"
  gem 'rubocop', require: false
  gem 'graphql', '1.7.4'
end

# Main commands
add_gems
bundle install

after_bundle do
  rails generate rspec:install

  rails_command "db:create"
  rails_command "db:migrate"

  get :init
  git add: "."
  git commit: %Q{ -m 'Complete basic Rails setup' }
end
