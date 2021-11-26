require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
  
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
  end

  test "create new product" do
    # se logger entant que Georges
    # Aller sur la page new
    # Remplir les 2 champs de formulaire
      # name
      # tagline
    # Submit
    # Arriver sur index
    # Verifier que la tagline est bien présente sur la page et égale à celle que j'ai rentré

    login_as users(:george)
    visit "/products/new"
    # save_and_open_screenshot

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # save_and_open_screenshot

    click_on 'Create Product'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to code"

  end



end
