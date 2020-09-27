class LogGroupStats
  class << self
    def aggregate_stats(log_group:)
      stats = log_group.group_by_path.map { |group| stats(group) }
      aggregate(stats)
    end

    def aggregate_unique_stats(log_group:)
      stats = log_group.group_by_path.map { |group| unique_ip_stats(group) }
      aggregate(stats)
    end

    private

    def aggregate(array_of_hashes)
      singular_hash = array_of_hashes.reduce({}, :merge)
      sort(singular_hash)
    end

    def sort(hash)
      hash.sort_by { |_key, value| value }.reverse!
    end

    def stats(log_group)
      { log_group.logs.first.path => log_group.count }
    end

    def unique_ip_stats(log_group)
      { log_group.logs.first.path => log_group.unique.count }
    end
  end
end
