task :test_acceptance => 'test:acceptance'
namespace :test do
  desc 'Run Selenium tests'
  task :acceptance do
    require Rails.root + 'vendor/plugins/selenium-on-rails/lib/selenium_on_rails/acceptance_test_runner'
    SeleniumOnRails::AcceptanceTestRunner.new.run
  end
end

