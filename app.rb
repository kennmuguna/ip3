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
