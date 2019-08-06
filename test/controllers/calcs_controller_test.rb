require 'test_helper'

class CalcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calc = calcs(:one)
  end

  test "should get index" do
    get calcs_url
    assert_response :success
  end

  test "should get new" do
    get new_calc_url
    assert_response :success
  end

  test "should create calc" do
    assert_difference('Calc.count') do
      post calcs_url, params: { calc: { initial_deposit: @calc.initial_deposit, monthly_report: @calc.monthly_report, number_of_years: @calc.number_of_years, profitability_per_year: @calc.profitability_per_year, risk_level: @calc.risk_level } }
    end

    assert_redirected_to calc_url(Calc.last)
  end

  test "should show calc" do
    get calc_url(@calc)
    assert_response :success
  end

  test "should get edit" do
    get edit_calc_url(@calc)
    assert_response :success
  end

  test "should update calc" do
    patch calc_url(@calc), params: { calc: { initial_deposit: @calc.initial_deposit, monthly_report: @calc.monthly_report, number_of_years: @calc.number_of_years, profitability_per_year: @calc.profitability_per_year, risk_level: @calc.risk_level } }
    assert_redirected_to calc_url(@calc)
  end

  test "should destroy calc" do
    assert_difference('Calc.count', -1) do
      delete calc_url(@calc)
    end

    assert_redirected_to calcs_url
  end
end
