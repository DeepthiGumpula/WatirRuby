Given(/^I go to facebook website$/) do
  @browser.goto "http://www.facebook.com"
end

When(/^I fill the facebook registration form$/) do
  @browser.text_field(name:'firstname').set 'Desu'
  @browser.text_field(name:'lastname').set 'lav'
  @browser.text_field(xpath:"//input[@aria-label='Mobile number or email address']").set 'deeptigumpula_iam@gmail.com'
  @browser.text_field(xpath:"//input[@aria-label='Re-enter mobile number or email address']").set 'deeptigumpula_iam@gmail.com'

  @browser.text_field(xpath:"//input[@aria-label='New password']").set 'A1testaccount'
  @browser.select_list(id: 'day').select '5'
  @browser.select_list(id:'month').select 'Jan'
  @browser.select_list(id:'year').select '1987'
  @browser.radio(xpath:".//div[@id='reg_form_box']/descendant::input[@name='sex'][position()=1]").click
end

Then(/^I hit the create an account button$/) do
  @browser.button(name:'websubmit').click
  puts 'Yeppiee account is created'
  @browser.refresh
end