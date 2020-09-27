require_relative '../log'

RSpec.describe Log do
  subject { Log.new(path: '/', ip: '192.0.0.1') }

  describe 'attributes' do
    it { is_expected.to have_attributes(path: '/', ip: '192.0.0.1') }
  end
end
