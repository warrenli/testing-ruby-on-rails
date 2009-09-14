namespace :integrity do
  desc "Prepare database, run rspec and cucumber tests"
  task :build => ['db:migrate', 'spec', 'cucumber', 'metrics:all'] do
  end
end
