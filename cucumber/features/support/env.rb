require 'selenium-webdriver'

Before do
  @browser = Selenium::WebDriver.for :chrome
end

After do
  @browser.close
end