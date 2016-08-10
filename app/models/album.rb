class Album < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :title, length: {in: 5..30}
  scope :user_album, ->(user) { where(user_id: user) }

end
