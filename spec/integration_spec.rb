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
  
  describe('viewing all stylists', {:type => :feature}) do
      it('allows user to see list of stylists') do
          stylist = Stylist.new({:name => "Khadija"})
          stylist.save
          visit('/')
          click_link('View All stylists')
          expect(page).to have_content(stylist.name)
        end
      end

   describe('viewing details for a single stylist', {:type => :feature}) do
       it('allows user to click stylists and see their list of clients') do
           test_stylist = Stylist.new({:name => 'Amina'})
           test_stylist.save()
           test_client = Client.new({:name => "Ava", :phone => 793412678, :stylist_id =>test_stylist.id()})
           test_client/save()
           visit('/stylists')
           click_link(test_stylist.name())
           expect(page).to have_content(test_client.name())
        end
      end