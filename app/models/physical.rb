class Physical < ActiveRecord::Base
  belongs_to :user
  before_save :calc_bmi
  before_update :calc_bmi

  def calc_bmi
    self.bmi = weight / height**2 if height != 0
  end
end
