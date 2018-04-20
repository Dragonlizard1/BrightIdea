class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :delete_all
  validates :content, :user_id, presence: true

end
