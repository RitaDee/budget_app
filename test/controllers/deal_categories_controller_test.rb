require 'test_helper'

class DealCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deal_category = deal_categories(:one)
  end

  test 'should get index' do
    get deal_categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_deal_category_url
    assert_response :success
  end

  test 'should create deal_category' do
    assert_difference('DealCategory.count') do
      post deal_categories_url,
           params: { deal_category: { category_id: @deal_category.category_id, deal_id: @deal_category.deal_id } }
    end

    assert_redirected_to deal_category_url(DealCategory.last)
  end

  test 'should show deal_category' do
    get deal_category_url(@deal_category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_deal_category_url(@deal_category)
    assert_response :success
  end

  test 'should update deal_category' do
    patch deal_category_url(@deal_category),
          params: { deal_category: { category_id: @deal_category.category_id, deal_id: @deal_category.deal_id } }
    assert_redirected_to deal_category_url(@deal_category)
  end

  test 'should destroy deal_category' do
    assert_difference('DealCategory.count', -1) do
      delete deal_category_url(@deal_category)
    end

    assert_redirected_to deal_categories_url
  end
end
