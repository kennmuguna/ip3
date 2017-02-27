require('rspec')
  require('pg')
  require('client')

  DB = PG.connect({:dbname => 'hair_salon_test'})

  RSpec.configure do |config|
    config.after(:each) do
      DB.exec("DELETE FROM clients *;")
    end
  end

  describe(Client) do

      describe(".all") do
          it("starts off with no clients")
            expect(Client.all()).to(eq([]))
          end
        end

      describe("#name") do
            it("displays a client's name")
            client = Client.new({:name => "Adelaide"})
            expect(client.name()).to(eq("Adelaide"))
          end
        

      describe("#phone") do
          it("saves a clent's phone number")
          client = Client.new({:name => "Adelaide", :phone => 721924107, :id => null})
          expect(client.phone()).to(eq(721924107))
        end
      

      describe("#id") do
          it("sets a client's id after you save it")
          client = Client.new({:name => "Adelaide", :phone => 721924107, :id => null})
          expect(client.id()).to(be_an_instance_of(Fixnum))
        end
      
      
      describe("#save") do
          it("lets you save clients to the database")
          client = client.new({:name => "Adelaide", :phone => 721924107, :id => null})
          expect(client.id().to(eq([client])))
        end
      

      describe("#==") do
          it("is the same client if it has the same name")
          client1 = client.new({:name => "Adelaide", :phone => 721924107, :id => null})
          client2 = client.new({:name => "Adelaide", :phone => 721924107, :id => null})
          expect(client1).to(eq(client2))
        end
      
    

