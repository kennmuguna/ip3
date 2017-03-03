require("sinatra")
  require("sinatra/reloader")
  also_reload("lib/**/*.rb")
  require("./lib/stylist")
  require("./lib/client")
  also_reload("lib/**/*.rb")
  require("pg")

  DB = PG.connect({:dbname => "hair_salon"})

  get("/") do
    erb(:index)
  end

  get("/stylists/new") do
    erb(:stylist_form)
  end

  post("/stylists") do
    name = params.fetch("name")
    stylist = Stylist.new({:name => name, :id => nil})
    stylist.save()
    erb(:stylist_success)
  end

  get("/stylists") do
    @stylists = Stylists.all()
    erb(:stylists)
  end

  get("/stylists/:id") do
    @stylist = Stylist.find(params.fetch("id").to_i())
    erb(:stylist)
  end

  get("/clients/new") do
    erb(:client_form)
  end

  post("/clients") do
    name = params.fetch("name")
    client = Client.new({:name => name, :phone => phone, :id => nil})
    client.save()
    erb(:client_success)
  end

  get("/clients") do
    @clients = Clients.all()
    erb(:clients)
  end

  get("/clients/:id") do
    @client = Client.find(params.fetch("id").to_i())
    erb(:client)
  end
