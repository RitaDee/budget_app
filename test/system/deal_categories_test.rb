require "application_system_test_case"

class DealCategoriesTest < ApplicationSystemTestCase
  setup do
    @deal_category = deal_categories(:one)
  end

  test "visiting the index" do
    visit deal_categories_url
    assert_selector "h1", text: "Deal categories"
  end

  test "should create deal category" do
    visit deal_categories_url
    click_on "New deal category"

    fill_in "Category", with: @deal_category.category_id
    fill_in "Deal", with: @deal_category.deal_id
    click_on "Create Deal category"

    assert_text "Deal category was successfully created"
    click_on "Back"
  end

  test "should update Deal category" do
    visit deal_category_url(@deal_category)
    click_on "Edit this deal category", match: :first

    fill_in "Category", with: @deal_category.category_id
    fill_in "Deal", with: @deal_category.deal_id
    click_on "Update Deal category"

    assert_text "Deal category was successfully updated"
    click_on "Back"
  end

  test "should destroy Deal category" do
    visit deal_category_url(@deal_category)
    click_on "Destroy this deal category", match: :first

    assert_text "Deal category was successfully destroyed"
  end
end
