require 'ostruct'
require_relative '../log_group'

RSpec.describe LogGroup do
  subject { described_class.new(logs: logs) }

  describe 'attributes' do
    let(:logs) { [] }

    it { is_expected.to have_attributes(logs: []) }
  end

  describe '#stats' do
    subject { described_class.new(logs: [], stat_aggregator_class: stat_aggregator_class) }
    # Use LogGroupStats as a model of verifying double to make sure interface is valid & up-to-date
    let(:stat_aggregator_class) { double(LogGroupStats, aggregate_stats: nil) }

    it 'calls stats aggregator instance' do
      subject.stats

      expect(stat_aggregator_class).to have_received(:aggregate_stats)
    end
  end

  describe '#unique_stats' do
    subject { described_class.new(logs: [], stat_aggregator_class: stat_aggregator_class) }
    let(:stat_aggregator_class) { double(LogGroupStats, aggregate_unique_stats: nil) }

    it 'calls stats aggregator instance' do
      subject.unique_stats

      expect(stat_aggregator_class).to have_received(:aggregate_unique_stats)
    end
  end

  describe '#count' do
    let(:logs) { [1, 2, 3] }

    it 'returns count of objects in logs' do
      expect(subject.count).to eq(3)
    end
  end

  describe '#unique' do
    let(:logs) { [OpenStruct.new(ip: '192.0.0.1'), OpenStruct.new(ip: '192.0.0.1')] }

    it 'returns logs without duplicated ip' do
      expect(subject.unique.count).to eq(1)
    end
  end

  describe '#group_by_path'
end
