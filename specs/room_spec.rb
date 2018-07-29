require("minitest/autorun")
require("minitest/rg")
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestRoom < MiniTest::Test

  def setup
    drake = Song.new("In My Feelings", "Drake")
    j_cole = Song.new("No Role Modelz", "J Cole")
    rnb = [drake, j_cole]
    mrTariq = Guest.new("Mr Tariq", 100, 50)
    mrsAnwar = Guest.new("Mrs Anwar", 200, 60)
    @guests = [mrTariq, mrsAnwar]
    @room = Room.new("Rhythm and Base", @guests, 2, rnb, 10)

  end

  def test_room_name
    assert_equal("Rhythm and Base", @room.room_name)
  end

  def test_guests
    assert_equal(@guests, @room.guests)
  end

  def test_check_in_guest
    check_in_success = @room.check_in_guest(@mrsAnwar)
    assert_equal(2, @room.guests.length)
    assert_equal(true, check_in_success)
  end

  def test_check_in_guest_room_full
    waqas = Guest.new("Mr Waqas", 25, 90)
    # room full - 2 guests
    @room.check_in_guest(@guests)
    # try to check in one too many guests
    check_in_fail = @room.check_in_guest(waqas)
    # ensure we dont't add the extra guest
    assert_equal(2, @room.guests.length)
    # check we return false when we can't add a guest
    assert_equal(false, check_in_fail)

  end

  def test_checks_guest_has_enough_funds
    #check enough money in wallet
    @waqas = Guest.new("Mr Waqas", 25, 90)
    cant_check_in = @room.check_in_guest(@waqas)

    assert_equal(1, @room.guests.length)
    assert_equal(5, @waqas.money())
    assert_equal(false, check_in_fail)
  end

  def test_check_out_guest
    @room.check_out_guest("Mr Tariq")
    assert_equal(0, @room.guests.length)
  end

end
