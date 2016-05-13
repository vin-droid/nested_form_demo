class Post < ActiveRecord::Base
  has_one :album
  has_many :comments
  #belogs_to :user
  accepts_nested_attributes_for :album ,:reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
end
