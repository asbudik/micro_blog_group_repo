class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :posttags, dependent: :destroy
  has_many :tags, :through => :posttags
  
  validates_associated :post_tags
  validates :title, length: {:maximum => 50}, presence: true
  validates :body, length: {:maximum => 251}, presence: true
  def stringify_tags
    self.tags
      .map do |tag|
          tag.name
      end
      .join(", ")
  end

  def add_tags(tags_arr)
    existing = Tag.where(name: tags_arr)
    new_tags = tags_arr - existing.map {|tag| tag.name }
    existing.concat new_tags.map {|tag| Tag.create(name: tag)}
    self.tags = existing
  end
end