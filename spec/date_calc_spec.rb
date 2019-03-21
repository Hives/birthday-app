require 'date_calc'
require 'date'

describe DateCalc do
  describe "#countdown" do
    context 'my birthday is today' do
      before do
        today = Date.today
        @day = today.day
        @month = today.month
      end
      it 'returns 0' do
        expect(described_class.countdown(@day, @month)).to eq 0
      end
    end
  end
end
