require('capybara/rspec')
  require('./app')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('adding a new stylist', {:type => :feature}) do
      it('allows a user to click a stylyst and see the clients & details for them') do
          visit('/')
          click_link('Add New Stylist')
          fill_in('name', :with => 'Khadija')
          click_button('Add Stylist')
          expect(page).to have_content('Success')
        end
      end