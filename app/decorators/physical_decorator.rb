class PhysicalDecorator < Draper::Decorator
  delegate_all

  def bmi
    format('%.2f', object.bmi)
  end
end
