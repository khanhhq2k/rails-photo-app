class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :album
  validates :title, presence: true
  validates :title, length: {in: 5..30}
  has_attached_file :image, styles: { medium: "900x900>", thumb: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :image, attachment_presence: true
  paginates_per 8
  scope :public_photos, -> { where(public: true) }
end
