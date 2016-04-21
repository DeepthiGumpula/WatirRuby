require 'watir-webdriver'
require 'selenium-webdriver'

Then(/^I print the browser name$/) do
  browserName = @browser.name
  puts "Browser name: #{browserName}"
end

Then(/^I print the browser ready state$/) do
  readyState = @browser.ready_state
  puts "Browser ready state: #{readyState}"
end

And(/^I click ABOUT link$/) do
  @browser.link(text: 'ABOUT').click
end

Then(/^I click back on the browser$/) do
  @browser.back
  puts "Browser title after back: #{@browser.title}"
end

And(/^I click forward on the browser$/) do
  @browser.forward
  puts "Browser title after forward: #{@browser.title}"
end

And(/^I click refresh on the browser$/) do
  @browser.refresh
  puts "Browser title after refresh: #{@browser.title}"
end

When(/^I open practiceselenium website$/) do
  @browser.goto "http://www.practiceselenium.com/practice-form.html"
end

And(/^I fill the form with values$/) do
  first_name = @browser.text_field(name: 'firstname')
  last_name = @browser.text_field(name: 'lastname')
  first_name.set 'firstname'
  last_name.set 'lastname'

  male_radio = @browser.radio(id:'sex-0')
  female_radio = @browser.radio(id:'sex-1')
  female_radio.click

  exp_1 = @browser.radio(id: 'exp-0')
  exp_2 = @browser.radio(id: 'exp-1')
  exp_3 = @browser.radio(id: 'exp-2')
  exp_3.set

  date_if_stopped = @browser.text_field(id: 'datepicker')
  date_if_stopped.set '1/1/2000'

  black_tea = @browser.checkbox(id: 'tea1')
  red_tea = @browser.checkbox(id: 'tea2')
  oolong_tea = @browser.checkbox(id: 'tea3')
  oolong_tea.set

  harmless_addiction = @browser.checkbox(id: 'tool-1')
  harmless_addiction.set

  continents_select = @browser.select_list(id: 'continents')
  continents_select.select 'Asia'

  another_select_list = @browser.select_list(id: 'selenium_commands')
  another_select_list.select 'Navigation Commands'
end

And(/^I hit submit button$/) do
  @browser.button(id:'submit').click
end

Then(/^I go back to Welcome page and verify title$/) do
  @browser.back
end