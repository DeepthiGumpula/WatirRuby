Then(/^I have a variable b$/) do
  @b = 3
end

Then(/^I have a variable a$/) do
  @a = 3
end


When(/^I add and b$/) do
  @sum = @a + @b
end


Then(/^I display the sum$/) do
  puts "the sum :#{@sum}"
end



Then(/^I print title, url and page source$/) do
  pageTitle = @browser.title
  pageURL = @browser.url
  pageSource = @browser.html
  puts "Page Title : #{pageTitle}"
end

