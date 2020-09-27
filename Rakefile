require_relative 'rake_helper'
require_relative 'log_csv_parser'

namespace :log do
  task :stats, :file do |_t, args|
    stats = calculate_occurences(file: args[:file])
    present(stats)
  end

  namespace :stats do
    task :unique_ips, :file do |_t, args|
      stats = calculate_unique_occurences(file: args[:file])
      present(stats)
    end
  end
end
