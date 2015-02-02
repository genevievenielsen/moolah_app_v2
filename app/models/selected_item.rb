class SelectedItem < ActiveRecord::Base

  belongs_to :user
  belongs_to :item
  belongs_to :cart

  belongs_to :color_option
  belongs_to :size_option

end
