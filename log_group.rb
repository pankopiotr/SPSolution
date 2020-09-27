require_relative 'log_group_stats'

class LogGroup
  attr_reader :logs

  def initialize(logs:, stat_aggregator_class: LogGroupStats)
    @logs = logs
    @stat_aggregator_class = stat_aggregator_class
  end

  def count
    logs.size
  end

  def group_by_path
    new_groups = logs.group_by(&:path)
    new_groups.map do |group|
      array_of_logs = group[1]
      LogGroup.new(logs: array_of_logs)
    end
  end

  def stats
    stat_aggregator_class.aggregate_stats(log_group: self)
  end

  def unique
    logs.uniq(&:ip)
  end

  def unique_stats
    stat_aggregator_class.aggregate_unique_stats(log_group: self)
  end

  private

  attr_reader :stat_aggregator_class
end
