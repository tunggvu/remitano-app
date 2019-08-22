class Movie < ApplicationRecord
  belongs_to :user
  YOUTUBE_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  validates :url, presence: true, format: YOUTUBE_FORMAT
end
