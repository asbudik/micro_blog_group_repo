class User < ActiveRecord::Base
  has_many :posts
  has_many :pages
  has_many :tags, -> { readonly }, through: :posts

<<<<<<< HEAD
  validates :email, confirmation: true, presence: true
  validates :email, uniqueness: true
=======
  validates :email, confirmation: true, presence: true, uniqueness: true
>>>>>>> 87b95cc81872460ff04634464b20a9b8cfb3f14d
  validates :email_confirmation, presence: true
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, :multiline => true
  validates :email_confirmation, presence: true
  validates_presence_of :first_name
  validates_presence_of :last_name
end
