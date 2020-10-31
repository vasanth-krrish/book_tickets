module ApplicationHelper
  def user_avatar(user, size = 100)
    if user.avatar.attached?
      if user.avatar.variable?
        user.avatar.variant(resize: "#{size}x#{size}")
      end
    else
      "https://via.placeholder.com/#{size}"
    end
  end

  def movie_language(movie)
    str = ""
    movie = movie.languages.map { |e| e.language }
    (movie.length - 1).times do |i|
      str << movie[i] + ", "
    end
    str += movie.last
    return str
  end

  def movie_genre(movie)
    str = ""
    movie = movie.genres.map { |e| e.genre }
    (movie.length - 1).times do |i|
      str << movie[i] + ", "
    end
    str += movie.last
    return str
  end

  def movie_image(movie)
    if movie.image.attached? && movie.image.variable?
      movie.image.variant(resize: "240x360")
    else
      "https://via.placeholder.com/240x360"
    end
  end

  def theatre_image(theatre, size=100 )
    if theatre.image.attached? && theatre.image.variable?
      theatre.image.variant(resize: "#{size}x#{size}")
    else
      "https://via.placeholder.com/#{size}"
    end
  end

  def get_screen_time(timing)
    s,t  = "", ""
    if timing[0..1].to_i < 12
      s = timing + " am"
    elsif timing[0..1].to_i == 12
      if timing[3..].to_i > 0
        s = timing + " pm"
      else
        s = timing + " am"
      end
    else
      s = ((timing[0..1].to_i)-12 ).to_s + timing[2..] + " pm"
    end
    return s
  end

  def min_date(movie)
    if movie.premiere >= Date.today
      return movie.premiere
    else
      return Date.today
    end
  end
end
