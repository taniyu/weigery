# -*- coding: utf-8 -*-
module Graph
  extend ActiveSupport::Concern

  included  do
    def self.hw_graph
      physicals = order(:measurement_date).limit(7)
      LazyHighCharts::HighChart.new('graph') do |f|
        f.title(text: '身長 & 体重')
        f.xAxis(categories: physicals.pluck(:measurement_date))
        f.series(name: '身長(cm)', yAxis: 0, data: physicals.pluck(:height))
        f.series(name: '体重(kg)', yAxis: 1, data: physicals.pluck(:weight))
        f.yAxis [
          { title: { text: '身長(cm)' } },
          { title: { text: '体重(kg)' }, opposite: true }
        ]
        f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      end
    end

    def self.bpp_graph
      physicals = order(:measurement_date).limit(7)
      LazyHighCharts::HighChart.new('graph') do |f|
        f.title(text: '血圧 & 脈拍')
        f.xAxis(categories: physicals.pluck(:measurement_date))
        f.series(name: '最高血圧', yAxis: 0, data: physicals.pluck(:sbp))
        f.series(name: '最低血圧', yAxis: 0, data: physicals.pluck(:dbp))
        f.series(name: '脈拍', yAxis: 0, data: physicals.pluck(:pulse))
        f.yAxis [
          { title: { text: '血圧 脈拍' } }
        ]
        f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      end
    end
  end
end
