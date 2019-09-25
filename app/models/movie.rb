class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  YOUTUBE_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  validates :url, presence: true, format: YOUTUBE_FORMAT
end
