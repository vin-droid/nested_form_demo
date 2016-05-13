class Album < ActiveRecord::Base
belongs_to :post  
has_many :photos  
has_many :videos


 accepts_nested_attributes_for :videos,  :allow_destroy => true
 accepts_nested_attributes_for :photos,  :allow_destroy => true
end
