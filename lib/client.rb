class Client
    attr_reader(:name, :phone, :stylist_id)

    define_method (:initialize) do |attributes|
        @name = attributes.fetch(:name)
        @phone = attributes.fetch(:phone)
        @stylist_id = attributes.fetch(:stylist_id)
    end

    define_singleton_method (:all) do
        returned_clients = DB.exec("SELECT * FROM clients;")
        clients = []
        returned_clients.each() do |client|
            name = client.fetch("name")
            phone = client.fetch("phone")
            stylist_id = stylist_id.fetch("stylist_id")
            clients.push(Clients.new({:name => name, :phone => phone, :stylist_id => stylist_id}))
        end
        clients
    end

    define_method (:name) do
        @name
    end
    
    define_method (:save) do
        result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
        @id = result.first().fetch("id").to_i()
    end



    define_method (:==) do
        self.name().==(another_client.name()).&(self.phone().==(another_client.phone())).&(self.id().==(another_client.id()))
    end 
end