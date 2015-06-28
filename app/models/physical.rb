# == Schema Information
#
# Table name: physicals
#
#  id               :integer          not null, primary key
#  user_id          :integer          default(0), not null
#  height           :float            default(0.0), not null
#  weight           :float            default(0.0), not null
#  sbp              :integer          default(0), not null
#  dbp              :integer          default(0), not null
#  pulse            :integer          default(0), not null
#  bmi              :float            default(0.0), not null
#  measurement_date :date             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Physical < ActiveRecord::Base
  belongs_to :user
  before_save :calc_bmi
  before_update :calc_bmi

  include Graph

  def calc_bmi
    self.bmi = weight / (height / 100.0)**2 if height != 0
  end
end
