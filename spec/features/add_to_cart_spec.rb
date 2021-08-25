require 'rails_helper'

RSpec.feature "Add To Cart", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They click on Add to Cart and the cart increases by one" do
    # ACT
    visit root_path
    save_screenshot

    expect(page).to have_content('My Cart (0)')

    product = page.first('article.product')
    button = product.find('button.btn')
    button.click

    # click_on 'Details'
    

    expect(page).to have_content('My Cart (1)')

    # DEBUG
    save_screenshot

    # VERIFY
    
    # expect(page).to have_css 'section.products-show'

  end
end
