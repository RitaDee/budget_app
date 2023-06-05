require "application_system_test_case"

class DealsTest < ApplicationSystemTestCase
  setup do
    @deal = deals(:one)
  end

  test "visiting the index" do
    visit deals_url
    assert_selector "h1", text: "Deals"
  end

  test "should create deal" do
    visit deals_url
    click_on "New deal"

    fill_in "Amount", with: @deal.amount
    fill_in "Name", with: @deal.name
    click_on "Create Deal"

    assert_text "Deal was successfully created"
    click_on "Back"
  end

  test "should update Deal" do
    visit deal_url(@deal)
    click_on "Edit this deal", match: :first

    fill_in "Amount", with: @deal.amount
    fill_in "Name", with: @deal.name
    click_on "Update Deal"

    assert_text "Deal was successfully updated"
    click_on "Back"
  end

  test "should destroy Deal" do
    visit deal_url(@deal)
    click_on "Destroy this deal", match: :first

    assert_text "Deal was successfully destroyed"
  end
end
