require 'ostruct'
require_relative '../log_group_stats'

RSpec.describe LogGroupStats do
  let(:log_group) do
    logs1 = [
      OpenStruct.new(path: '/', ip: '192.0.0.1'),
      OpenStruct.new(path: '/', ip: '192.0.0.1'),
      OpenStruct.new(path: '/', ip: '192.0.0.2')
    ]
    logs2 = [OpenStruct.new(path: '/about', ip: '192.0.0.1')]
    unique_logs1 = [
      OpenStruct.new(path: '/', ip: '192.0.0.1'),
      OpenStruct.new(path: '/', ip: '192.0.0.2')
    ]
    sub_log_group1 = OpenStruct.new(logs: logs1, count: 3, unique: unique_logs1)
    sub_log_group2 = OpenStruct.new(logs: logs2, count: 1, unique: logs2)
    OpenStruct.new(group_by_path: [sub_log_group1, sub_log_group2])
  end

  describe '.aggregate_stats' do
    it 'returns list of sorted arrays containing path and occurence count' do
      result = described_class.aggregate_stats(log_group: log_group)

      expect(result).to eq([['/', 3], ['/about', 1]])
    end
  end

  describe '.aggregate_unique_stats' do
    it 'returns list of sorted arrays containing path and unique IP occurence count' do
      result = described_class.aggregate_unique_stats(log_group: log_group)

      expect(result).to match_array([['/', 2], ['/about', 1]])
    end
  end
end
