class Post < ApplicationRecord

  mount_uploader :image, ImageUploader
  
  #アソシエーション(1:多)
  belongs_to :user
end
