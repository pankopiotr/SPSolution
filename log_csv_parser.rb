require 'csv'

require_relative './log'
require_relative './log_group'

class LogCSVParser
  def self.parse(file:, delimiter: ',', log_class: Log, log_group_class: LogGroup)
    logs = []

    CSV.foreach(file, col_sep: delimiter) do |path, ip|
      logs << log_class.new(path: path, ip: ip)
    end

    log_group_class.new(logs: logs)
  end
end
