require_relative '../log_csv_parser'

RSpec.describe LogCSVParser do
  describe '.parse' do
    it 'returns logs packed in log group', :aggregated_failures do
      log_class = spy('Log')
      log_group_class = spy('LogGroup')

      described_class.parse(
        file: 'spec/support/test_log.log',
        delimiter: ' ',
        log_class: log_class,
        log_group_class: log_group_class
      )

      expect(log_class).to have_received(:new).exactly(13).times
      expect(log_group_class).to have_received(:new).once
    end
  end
end
