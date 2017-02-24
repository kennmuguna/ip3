class Stylist
    attr_reader(:name)

    define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
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

    define_method(:==)  do |another_stylist|
        self.name().==(another_stylist.name())
    end
end