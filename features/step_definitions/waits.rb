And(/^I set pageload timeout$/) do
  @browser.driver.manage.timeouts.page_load =0
end

And(/^I set script timeout$/) do
  @browser.driver.manage.timeouts.script_timeout = 1
  puts @browser.execute_script("return jQuery.active")
end

And(/^I set implicit timeout$/) do
  # Set implicit timeout to 1 second and observe that it fails
  # Implicit timeout applies to all elements on page.
  @browser.driver.manage.timeouts.implicit_wait=2
end

Then(/^I print the text for target element$/) do
  period_element = @browser.link(id:"periodicElement")
  puts "Period element text --> #{period_element.text}"
end

When(/^I open seleniumframework website$/) do
  @browser.goto "http://www.seleniumframework.com/Practiceform/"
end

And(/^I click open new browser window$/) do
  puts "Before opening new window title --&gt; #{@browser.title}"
  @browser.button(id: "button1").click

  all_windows = @browser.windows
  puts "All window handles array after clicking new browser window --&gt; #{all_windows}"
  all_windows.each do |window|
    puts window.title
  end
end

Then(/^I switch to new window$/) do
  puts "Switching to new window...."
  @browser.window(title: "Selenium Framework | Selenium, Cucumber, Ruby, Java et al.").use
  puts "Printing new window url --&gt; #{@browser.url}"
end

And(/^back to parent window$/) do
  @browser.window(title: "Selenium Framework | Practiceform").use
  puts "Parent window url --&gt; #{@browser.url}"
end

And(/^I click javascript alert window$/) do
  @browser.element(id: "alert").click
end

Then(/^I print the text in javascript alert$/) do
  if @browser.alert.exists?
    alert = @browser.alert
    puts "Alert text --&gt; #{alert.text}"
    puts "Clicking ok on alert..."
    alert.ok
  end
end

And(/^I click new browser tab$/) do
  #Without maximize, the view port sometimes is too short and driver is not able to click on the button
  @browser.window.maximize
  new_browser_tab = @browser.buttons.find {|button| button.text == "New Browser Tab"}
  new_browser_tab.click
end

Then(/^I switch to new tab$/) do
  all_windows = @browser.windows
  all_windows.each do |window|
    puts window.title
  end
  @browser.window(title: "Selenium Framework | Selenium, Cucumber, Ruby, Java et al.").use
  puts "Printing url of newly opened tab --&gt; #{@browser.url}"
end

And(/^back to main window$/) do
  @browser.window(title: "Selenium Framework | Practiceform").use
  puts "After switching back to parent window , printing url --&gt; #{@browser.url}"
end

And(/^I click new message window button$/) do
  @browser.window.maximize
  puts "Parent window handle --&gt; #{@browser.driver.window_handles}"
  @parent_window_handle = @browser.driver.window_handles[0]
  new_message_window = @browser.buttons.find {|button| button.text == "New Message Window"}
  new_message_window.click
end

Then(/^I print text for message window$/) do
  # Since message window doesn't have title or url to differentiate it, we are not able to use @browser.windows appoach
  # either we have to use index or use another approach as below
  all_windows = @browser.driver.window_handles

  all_windows.each do |window|
    puts window
  end

  @browser.driver.switch_to.window(all_windows.last)
  puts "Message window text --&gt; #{@browser.text}"
end

When(/^I open yourhtmlsource website$/) do
  @browser.goto "http://yourhtmlsource.com/frames/inlineframes.html"
end

Then(/^I switch to frame and print its text$/) do
  frame = @browser.iframe(name: "bomb")
  frame_body = frame.element(tag_name: "body")
  puts frame_body.text
end