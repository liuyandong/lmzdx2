require 'test_helper'

class CreditCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get open" do
    get credit_cards_open_url
    assert_response :success
  end

  test "should get debit" do
    get credit_cards_debit_url
    assert_response :success
  end

  test "should get credit" do
    get credit_cards_credit_url
    assert_response :success
  end

  test "should get close" do
    get credit_cards_close_url
    assert_response :success
  end

end
