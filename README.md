Cuke Tips
===============================================================================

AKA I couldn't find a central source for Cucumber documentation so I made one.

This documentation is using the following:

* [Cucumber](https://cucumber.io/) (Obviously).
    - [Documentation](https://cucumber.io/docs)
* [Capybara](http://jnicklas.github.io/capybara/) for the testing bits.
    - [Documentation](https://github.com/jnicklas/capybara)
    - [Reference](http://www.rubydoc.info/github/jnicklas/capybara/master)
* [Sublime Text 3](http://www.sublimetext.com/3) for the text editor
    - With [Package Control](https://packagecontrol.io/) to assist.
* [Ruby on Rails](http://rubyonrails.org/) for the development environment.

Run your tests with `cucumber` (depending on environment). In Rails, run your
tests with `rake cucumber` or `bundle exec cucumber`.

Adding New 'Features'
---------------------------------------
To make a new feature, do the following:

1. In `features`, create a new "feature" file => `example.feature`
2. In `features/step_definitions`, create a ruby script "step" file.
   * Must end in `_step.rb`
   * Must match the name of the feature file
   * Example => `example_step.rb`
3. If you need common "support" scripts, put them in the `support` folder
   (getting web paths, FInding/clicking on common things, etc.)

File Format
---------------------------------------

### Feature File ###
    Feature: Feature Name
        Descripts go here. Usually these will start with some variation on the
        following format:
    
        In order to know if my code works
        As a story-driven developer
        I want to be able to test my code
    
        This format is not required, nor is any description, but it can help
    
        Scenario: Arbitrary Test
            Given I have initial input of "foo"
            When I press show
            Then I should see "foo"
    
        Scenario: Expanded Arbitrary Test
            Given I have initial input of "foo"
            And I have initial input of "bar"
            When I press show
            And I press combine
            Then I should see "foobar"
            And I should see "(combined)"

### Step Definition File ###
    # "Given" is usually initial data
    Given /^I have initial input of "(.+)" do |input|
        # do stuff; save the input somewhere
    end
    
    # "When" is usually action
    When /^I press (.+)$/ do |button_name|
        # do stuff; click/etc. on the button
    end
    
    # "Then" is usually results
    Then /^I should see "(.+)" do |results|
        # do stuff; verify result is shown
    end

Any `And` options are run as the most recent command. In the expanded example,
`And I have initial input of "bar"` is treated as if it started with `Given`
and `And I press combine` is treated as if it started with `When`.

Test Tagging
---------------------------------------
[Cucumber supports tags.](https://github.com/cucumber/cucumber/wiki/Tags)
You can tag tests using `@tag_name` syntax. Run only the tagged test by using
the `--tag` command: `cucumber --tags @tag_name`

### Special Tags ###
* `@javascript`: If you're testing a javascript-heavy website (e.g. using
  React.js) you need this tag over the relevant Scenarios or Features.
* `@wip`: Sort-of special. Skips all scenarios tagged this by default. If you
  want to run `@wip` tasks, run `cucumber --tags @wip`
* `@allow-rescue`: Turns off Cucumber’s exception capturing for the tagged
  scenario(s). Used when the code being tested is expected to raise exceptions.
* `@webkit`: If you need to get response headers you will need to use this(also need to gem install capybara-webkit and brew install qt5)

Useful Sublime Packages
---------------------------------------
Remember: `Cmd + Shift + p` opens package control

* **Cucumber**: Gives you syntax highlighting for feature files
* **Cucumber Step Finder**: Gives you step jump/searching
    - `Cmd + y`: Search all associated step definitions
    - `Cmd + Ctrl + m`: Jump to matching step definition

Rails Specific
---------------------------------------
Add this to your Gemfile:

    group :test do
        gem 'cucumber-rails'
        gem 'database_cleaner'
        gem 'capybara' #clicks things and such
        gem 'capybara-webkit' #optional, used for page response data. QT5 is a dependency, look here for install instructions: http://stackoverflow.com/questions/17075380/can-i-use-homebrews-qt5-with-capybara-webkit
    end
