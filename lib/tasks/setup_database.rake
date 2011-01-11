desc "Sets up the initial database for Redmine. Generates sessions, migrates up, and loads default data."

namespace :redmine do
  task :setup_database => ["generate_session_store", "db:migrate", "redmine:load_default_data"]
end
