require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) {Dessert.new('brownie', 50, "richard")}
  let(:chef1) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end


    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("brownie", "hella", "richard")}.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("salt")
      expect(dessert.ingredients).to eq(["salt"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
    dessert.add_ingredient("sugar")
    dessert.add_ingredient("spice")
    dessert.add_ingredient("everything nice")
    order = dessert.ingredients
    dessert.mix!
    expect(dessert.ingredients).to_not eq(dessert.mix!.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(5)
      expect(dessert.quantity).to eq(45)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(61)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include("Richard")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef1).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
