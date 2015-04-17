module TracksHelper
  include ERB::Util

  def ugly_lyrics(lyrics)
    formatted_lyrics = ""

    lyrics.lines.each do |line|
      formatted_lyrics << "♫ #{h(line)}"
    end

    "<pre>#{formatted_lyrics}</pre>".html_safe
  end

end
