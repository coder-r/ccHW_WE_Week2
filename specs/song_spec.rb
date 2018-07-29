require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")

class TestSong < MiniTest::Test

  def setup

    @song = Song.new("In My Feelings", "Drake")

  end

  def test_name
    assert_equal("In My Feelings", @song.song_name)
  end

  def test_artist
    assert_equal("Drake", @song.song_artist)
  end
end
