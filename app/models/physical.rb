# -*- coding: utf-8 -*-
class Physical < ActiveRecord::Base
  belongs_to :user
  before_save :calc_bmi
  before_update :calc_bmi

  def calc_bmi
    self.bmi = weight**2 / height if height != 0
  end

  def self.hw_graph(user_id)
    user_physicals = User.find_by(id: user_id).physicals.order(:measurement_date).limit(7)
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: '身長 & 体重')
      f.xAxis(categories: user_physicals.pluck(:measurement_date))
      f.series(name: '身長(cm)', yAxis: 0, data: user_physicals.pluck(:height))
      f.series(name: '体重(kg)', yAxis: 0, data: user_physicals.pluck(:weight))
      f.yAxis [
        { title: { text: '身長(cm) 体重(kg)' } }
      ]
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
    end
  end

  def self.bpp_graph(user_id)
    user_physicals = User.find_by(id: user_id).physicals.order(:measurement_date).limit(7)
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: '血圧 & 脈拍')
      f.xAxis(categories: user_physicals.pluck(:measurement_date))
      f.series(name: '最高血圧', yAxis: 0, data: user_physicals.pluck(:sbp))
      f.series(name: '最低血圧', yAxis: 0, data: user_physicals.pluck(:dbp))
      f.series(name: '脈拍', yAxis: 0, data: user_physicals.pluck(:pulse))
      f.yAxis [
        { title: { text: '血圧 脈拍' } }
      ]
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
    end
  end
end
