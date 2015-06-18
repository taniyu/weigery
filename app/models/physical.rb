class Physical < ActiveRecord::Base
  belongs_to :user
  before_save :calc_bmi

  def calc_bmi
    self.bmi = self.weight ** 2 / self.height if self.height != 0
    self
  end
end
