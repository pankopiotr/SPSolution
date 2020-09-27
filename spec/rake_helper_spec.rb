require_relative '../rake_helper'

RSpec.describe do
  describe 'calculate_occurences' do
    it 'returns list of sorted arrays containing path and occurence count' do
      result = calculate_occurences(file: 'spec/support/test_log.log')

      expect(result).to eq([['/help_page/1', 5], ['/home', 4], ['/about/2', 3], ['/contact', 1]])
    end
  end

  describe 'calculate_unique_occurences' do
    it 'returns list of sorted arrays containing path and unique IP occurence count' do
      result = calculate_unique_occurences(file: 'spec/support/test_log.log')

      expect(result).to eq([['/help_page/1', 4], ['/home', 3], ['/about/2', 2], ['/contact', 1]])
    end
  end
end
