require 'date_stuff'
require 'date'

describe DateStuff do
  describe "#countdown" do
    context 'input is in string format' do
      it 'should handle it' do
        day = "21"
        month = "03"
        expect { described_class.countdown(day, month) }.not_to raise_error
      end
    end

    context 'input is in integer format' do
      it 'should handle it' do
        day = 21
        month = 03
        expect { described_class.countdown(day, month) }.not_to raise_error
      end
    end

    context 'my birthday is today' do
      it 'returns 0' do
        birthday = Date.today
        day = birthday.day
        month = birthday.month
        expect(described_class.countdown(day, month)).to eq 0
      end
    end

    context 'my birthday is tomorrow' do
      it 'returns 1' do
        birthday = Date.today + 1
        day = birthday.day
        month = birthday.month
        expect(described_class.countdown(day, month)).to eq 1
      end
    end

    context 'my birthday was yesterday' do
      context "and there is a leap day between now and my next birthday" do
        it 'returns 365' do
          today = Date.strptime("2019-03-21")
          day = 20
          month = 03
          expect(described_class.countdown(day, month, today)).to eq 365
        end
      end

      context "and there isn't a leap day between now and my next birthday" do
        it 'returns 364' do
          today = Date.strptime("2018-03-21")
          day = 20
          month = 03
          expect(described_class.countdown(day, month, today)).to eq 364
        end
      end
    end
  end
end
