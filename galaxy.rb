require "capybara"
require "capybara/dsl"
require "selenium-webdriver"

Capybara.current_driver = :selenium

Capybara.configure do |config|
  config.run_server = false
  # TODO setup hostname via command line arg
  config.app_host   = "http://galaxy"
end

id = "admin@galaxy.org"
pass = "admin"

module Galaxy
  class Page
    include Capybara::DSL
  end

  class HomePage < Page
    def goTop
      visit "/"
      save_screenshot("/work/top.png")
      self
    end

    def clickUser
      all("[id='user']")[0].click
      sleep 3

      save_screenshot("/work/clickUser.png")
      self
    end

    def clickLogin
      find(:xpath, "//a[contains(@href, '/user/login')]").click
      sleep 3

      save_screenshot("/work/clickLogin.png")
      self
    end

    def login id, password
      within_frame('galaxy_main'){
        fill_in 'login' , with: id
        fill_in 'password' , with: password
        save_screenshot("/work/login.png")
        sleep 3
        find(:xpath, "//input[contains(@name, 'login_button')]").click
      }
      save_screenshot("/work/login_click.png")
      self
    end
  end
end

Galaxy::HomePage.new
  .goTop
  .clickUser
  .clickLogin
  .login(id,pass)
