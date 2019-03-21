require 'birthday_calc'
require 'date'

describe BirthdayCalc do
  describe "#countdown" do
    context 'my birthday is today' do
      it 'returns 0' do
        today = Date.today
        day = today.day
        month = today.month
        expect(described_class.countdown(day, month)).to eq 0
      end
    end

    context 'my birthday is tomorrow' do
      it 'returns 1' do
        today = Date.today + 1
        day = today.day
        month = today.month
        expect(described_class.countdown(day, month)).to eq 1
      end
    end
  end
end
