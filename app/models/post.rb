class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  validates :name, presence: true
  validates :content, presence: true

  def tag_attributes=(tag_attributes)
    tag_attributes.values.each do |value|
      tag = Tag.find_or_create_by(value)
      self.tags << tag unless tag.name == ""
    end
  end
end
