require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save properly when all fields are valid' do
      @category = Category.new(name: "Shrubbery")
      @product = Product.new(name: "Bush", price: 1000, quantity: 10, category: @category)
      
      expect(@product).to be_valid
    end

    it 'should have a name' do
      @category = Category.new(name: "Shrubbery")
      @product = Product.new(name: nil, price: 1000, quantity: 10, category: @category)
      
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should have a valid price' do
      @category = Category.new(name: "Shrubbery")
      @product = Product.new(name: "Bush", price: "string", quantity: 10, category: @category)
      
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it 'should have a quantity' do
      @category = Category.new(name: "Shrubbery")
      @product = Product.new(name: "Bush", price: 1000, quantity: nil, category: @category)
            
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should have a category' do
      @category = Category.new(name: "Shrubbery")
      @product = Product.new(name: nil, price: 1000, quantity: 10, category: nil)
      
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end

# describe '#id' do
#   it 'should not exist for new records' do
#     @widget = Widget.new
#     expect(@widget.id).to be_nil
#   end

#   it 'should be auto-assigned by AR for saved records' do
#     @widget = Widget.new
#     # we use bang here b/c we want our spec to fail if save fails (due to validations)
#     # we are not testing for successful save so we have to assume it will be successful
#     @widget.save!

#     expect(@widget.id).to be_present
#   end
# end