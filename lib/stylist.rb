class Stylist
    attr_reader(:name, :id)

    define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @id = attributes.fetch(:id)
    end

    define_method(:==)  do |another_stylist|
        self.name().==(another_stylist.name())
    end
end

    define_singleton_method(:all) do
        returned_names = DB.exec("SELECT * FROM stylists;")
        stylists = []
        returned_names.each() do |stylist|
            name = task.fetch("name")
            stylists.push(Stylist.new({:name => name}))
        end
        stylists
    end

    define_method(:save) do
        DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}')")
    end
end