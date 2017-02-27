require("rspec")
  require("pg")
  require("stylist")

  DB = PG.connect({:dbname => "hair_salon_test"})

describe(Stylist) 

    describe("#==") do
      it("is the same stylist if it has the same name") do
          stylist1 = Stylist.new({:name => "Aisha"})
          stylist2 = Stylist.new({:name => "Aisha"})
          expect(stylist1).to(eq(stylist2))
        end
      end

    describe(".all") do
      it("is empty at first") do
          expect(Stylist.all()).to(eq([]))
      end
    end

    describe("#save") do
      it("adds a stylist to the array of saved stylists") do
        test_stylist = Stylist.new({:name => "Khadija"})
        test_stylist.save()
        expect(Stylist.all()).to(eq([test_stylist]))
      end
     end
    