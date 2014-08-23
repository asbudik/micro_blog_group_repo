class User < ActiveRecord::Base
  has_many :posts
  has_many :pages
  has_many :tags, -> { readonly }, through: :posts
end
