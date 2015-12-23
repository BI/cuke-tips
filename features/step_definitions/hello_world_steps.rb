# Setup help: http://loudcoding.com/posts/quick-tutorial-starting-with-cucumber-and-capybara-bdd-on-rails-project/

Given(/^I have the greeting "(.*?)"$/) do |greeting|
  @message = "#{greeting},"
end

When(/^I have the subject "(.*?)"$/) do |subject|
  @message = "#{@message} #{subject}." 
end

Then(/^I have the message "(.*?)"$/) do |message|
  puts "Result:"
  if message == @message
    puts message
  else
    raise "Got '#{@message}' instead of '#{message}'"
  end
end