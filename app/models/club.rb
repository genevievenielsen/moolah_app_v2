class Club < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
