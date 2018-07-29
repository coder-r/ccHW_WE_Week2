class Song

  attr_reader :song_name, :song_artist

  def initialize(song_name, song_artist)
    @song_name = song_name
    @song_artist = song_artist
  end
end
