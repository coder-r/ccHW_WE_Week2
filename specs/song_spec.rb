require("minitest/autorun")
require("minitest/rg")
require relative("../song.rb")

class TestSong < MiniTest::Test

  def setup

    @song = Song.new("In My Feelings", "Drake")

  end

  def test_name
    assert_equal("In My Feelings", @song.name)
  end

  def test_artist
    assert_equal("Drake", @song.artist)
  end
