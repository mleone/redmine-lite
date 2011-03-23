desc "Sets up the initial database for Redmine. Generates sessions, migrates up, and loads default data."

namespace :redmine do
  task :setup_database => ["generate_session_store", "db:migrate", "redmine:load_default_data"] do
    puts "Enter your gmail username for SMTP"
    print ">> "
    username = $stdin.gets.strip
    puts "Enter gmail password for the account (only stored locally!)"
    print ">> "
    password = $stdin.gets.strip
    data = "#{username} #{password}"
    File.open(GMAIL_FILE_PATH, 'w') { |f| f.write data }   
    puts "Wrote gmail auth info to #{GMAIL_FILE_PATH}"
    puts "Done!"
  end
end
