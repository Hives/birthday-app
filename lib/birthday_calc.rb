require 'date'

module BirthdayCalc
  def self.countdown(day, month)
    today = Date.today
    birthday = DateTime.strptime("#{day} #{month}", '%d %m')
    (birthday - today).to_i
  end
end
