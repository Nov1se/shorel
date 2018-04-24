class Post < ApplicationRecord
  validates :title, :content, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => { :message => "Post already exist"}
  belongs_to :user
end
