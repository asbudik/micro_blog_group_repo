class Page < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name
  validates_format_of :name, :with => /\A(about|contact)+\z/

  validates_presence_of :content
end
