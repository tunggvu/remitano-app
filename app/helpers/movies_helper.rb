module MoviesHelper
  def convert_to_video(url)
    VideoInfo.new(url)
  end
end
