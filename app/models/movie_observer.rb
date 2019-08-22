class MovieObserver < ActiveRecord::Observer
  def before_save(resource)
    movie = Yt::Movie.new url: resource.url
    resource.uid = movie.id
    resource.title = movie.title
    resource.published_at = video.published_at
  rescue Yt::Errors::NoItems
    resource.title = ''
  end
end
