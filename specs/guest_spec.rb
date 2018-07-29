require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup

    @guest1 = Guest.new("Upul", 37, 50)
    @guest2 = Guest.new("Andrew", 38, 25)
    @guest3 = Guest.new("Sithara", 39, 15)
    @guest4 = Guest.new("Jane", 34, 60)

  end

  def test_guest_name

    assert_equal("Jane", @guest4.guest_name)

  end

  def test_guest_age

    assert_equal(34, @guest4.guest_age)

  end

  def test_money
    assert_equal(60, @guest4.money())
  end

  def test_pay_money_sufficient_funds
    sufficient_funds = @guest4.pay_money(10)
    assert_equal(50, @guest4.money)
    assert_equal(true, sufficient_funds)
  end

  def test_pay_money_insufficient_funds
    insufficient_funds = @guest4.pay_money(70)
    assert_equal(60, @guest4.money)
    assert_equal(false, insufficient_funds)
  end

end
