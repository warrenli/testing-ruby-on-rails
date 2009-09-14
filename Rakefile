# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'


require 'metric_fu'
MetricFu::Configuration.run do |config|
    #define which metrics you want to use
    config.metrics  = [:churn, :saikuro, :stats, :flog, :flay, :reek, :roodi, :rcov]
    config.graphs   = [:flog, :flay, :reek, :roodi, :rcov]
    config.flay     = { :dirs_to_flay => ['app', 'lib']  }
    config.flog     = { :dirs_to_flog => ['app', 'lib']  }
    config.reek     = { :dirs_to_reek => ['app', 'lib']  }
    config.roodi    = { :dirs_to_roodi => ['app', 'lib'] }
    config.churn    = { :start_date => "1 month ago", :minimum_churn_count => 10}
    config.rcov     = { :test_files => ['test/**/*_test.rb',
#                                        'script/cucumber',
                                        'spec/**/*_spec.rb'],
                        :rcov_opts => ["--sort coverage",
                                       "--no-html",
                                       "--text-coverage",
                                       "--no-color",
                                       "--profile",
                                       "--rails",
                                       "--exclude /gems/,/Library/,spec,/rubygems/"]}

    config.base_directory     = 'doc/metrics'
    config.scratch_directory  = File.join(config.base_directory, 'scratch')
    config.output_directory   = File.join(config.base_directory, 'output')
    config.data_directory     = File.join(config.base_directory, '_data')

    config.saikuro  = { :output_directory => File.join(config.scratch_directory, 'saikuro'),
                        :input_directory => ['app', 'lib'],
                        :cyclo => "",
                        :filter_cyclo => "0",
                        :warn_cyclo => "5",
                        :error_cyclo => "7",
                        :formater => "text"}
end

