When(/^I open practiceselenium\.com website$/) do
  @browser.goto "http://www.practiceselenium.com/practice-form.html"
end

Then(/^I find first and last name and print the html$/) do
  first_name = @browser.text_field(name: 'firstname')
  last_name = @browser.text_field(name: 'lastname')
  puts "First Name HTML: #{first_name.html}"
  puts "Last Name HTML: #{last_name.html}"
end

Then(/^I find radio button male and print the html$/) do
  male_radio = @browser.radio(id: 'sex-0')
  female_radio = @browser.radio(id: 'sex-1')
  #http://watirwebdriver.com/web-elements/
  #http://watir.com/examples/
  puts "Radio Male html: #{male_radio.html}"
  puts "Radio Femal html: #{female_radio.html}"
end

Then(/^I find check box and print the html$/) do
  black_tea = @browser.checkbox(id: 'tea1')
  red_tea = @browser.checkbox(id: 'tea2')
  oolong_tea = @browser.checkbox(id: 'tea3')

  puts "Black Tea HTML: #{black_tea.html}"
  puts "Red Tea HTML: #{red_tea.html}"
  puts "oolong Tea HTML: #{oolong_tea.html}"

end

Then(/^I find select list and print html$/) do
  continents_select = @browser.select_list(id: 'continents')
  options = continents_select.options

  puts "Select List options: #{options}"

  options.each do |option|
    puts option.html
  end

end

Then(/^I find another select list and print html$/) do
  another_select_list = @browser.select_list(id: 'selenium_commands')
  options = another_select_list.options

  options.each do |option|
    puts option.html
  end

end

Then(/^I find menu and print the html$/) do
  menu_element = @browser.link(text: 'Menu')

  puts "Menu html: #{menu_element.html}"
end

Then(/^I find button and print the html$/) do
  ok_button = @browser.button(id: 'ubmit')

  puts "Button html: #{ok_button.html}"
end

Then(/^I find div and print html$/) do
  div_element = @browser.div(class: 'wsb-htmlsnippet-element')

  puts div_element.html

  #puts @browser.h1(text: 'Practice Form').html
end