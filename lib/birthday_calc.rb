require 'date'

module BirthdayCalc
  def self.countdown(day, month, today = Date.today)
    birthday = Date.strptime("#{day} #{month}", '%d %m')
    birthday = birthday.next_year if birthday < today
    (birthday - today).to_i
  end
end
