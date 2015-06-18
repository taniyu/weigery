class Physical < ActiveRecord::Base
  belongs_to :user
  before_save :calc_bmi
  before_update :calc_bmi

  def calc_bmi
    self.bmi = weight ** 2 / height if height != 0
    self
  end
end
