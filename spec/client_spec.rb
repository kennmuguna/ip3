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
          it("starts off with no clients") do
            expect(Client.all()).to(eq([]))
          end
        end

      describe("#name") do
            it("displays a client's name") do
            client = Client.new({:name => "Adelaide"})
            expect(client.name()).to(eq("Adelaide"))
            end
          end
        

      describe("#phone") do
          it("saves a clent's phone number") do
          client = Client.new({:name => "Adelaide", :phone => 721924107, :id => null})
          expect(client.phone()).to(eq(721924107))
          end
        end
      

      describe("#id") do
          it("sets a client's id after you save it") do
          client = Client.new({:name => "Adelaide", :phone => 721924107, :id => null})
          expect(client.id()).to(be_an_instance_of(Fixnum))
          end
        end
      
      
      describe("#save") do
          it("lets you save clients to the database") do
          client = Client.new({:name => "Adelaide", :phone => 721924107, :id => null})
          expect(client.id().to(eq([client])))
          end
        end
      

      describe("#==") do
          it("is the same client if it has the same name") do
          client1 = Client.new({:name => "Adelaide", :phone => 721924107, :id => null})
          client2 = Client.new({:name => "Adelaide", :phone => 721924107, :id => null})
          expect(client1).to(eq(client2))
          end
        end

      describe(".find") do
          it("returns a client by his/her id") do
            test_client = Client.new({:name => "Adelaide"})
          end
      end

    end
      
    

