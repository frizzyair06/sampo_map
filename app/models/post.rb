class Post < ApplicationRecord

  mount_uploader :image, ImageUploader
  
  #アソシエーション(1:多)
  belongs_to :user
  acts_as_taggable   # acts_as_taggable_on :tags の省略

end
