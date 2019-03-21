def complete_form(name, day, month)
  visit "/"
  fill_in('name', with: name)
  fill_in('day', with: day)
  page.select(month, from: 'month')
  click_button('Go!')
end
