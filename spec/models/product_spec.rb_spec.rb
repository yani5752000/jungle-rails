require 'rails_helper'

RSpec.describe Product, type: :model do
  


  describe 'Validations' do
    # validation tests/examples here
    it 'validates' do
      @category = Category.new
      @product = Product.new
      @product.name = "nail"
      @product.price = 21.34
      @product.quantity = 2
      @product.category = @category

      @product.save!

      expect(@product).to be_present
    end
    it 'validates' do
      @category = Category.new
      @product = Product.new
      @product.name = nil
      @product.price = 21.34
      @product.quantity = 2
      @product.category = @category

      @product.save!

      expect(@product.id).to be_present
    end
    it 'validates' do
      @category = Category.new
      @product = Product.new
      @product.name = "nail"
      @product.price = nil
      @product.quantity = 2
      @product.category = @category

      @product.save!

      expect(@product.id).to be_present
    end
    it 'validates' do
      @category = Category.new
      @product = Product.new
      @product.name = "nail"
      @product.price = 21.34
      @product.quantity = nil
      @product.category = @category

      @product.save!

      expect(@product.id).to be_present
    end
    it 'validates' do
      @category = Category.new
      @product = Product.new
      @product.name = "nail"
      @product.price = 21.34
      @product.quantity = 2
      @product.category = nil

      @product.save!

      expect(@product.id).to be_present
    end
  
  end
end
