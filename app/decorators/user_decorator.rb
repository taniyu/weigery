class UserDecorator < Draper::Decorator
  delegate_all

  def name
    return '未入力' if object.name.empty?
    object.name
  end

  def last_sign_in_at
    return object.last_sign_in_at.strftime('%Y/%m/%d %H:%M') if object.last_sign_in_at
    '未設定'
  end

  def age
    return '未入力' unless object.birth
    "#{(DateTime.now.to_date - object.birth).to_i / 365}歳"
  end

  def sex
    return '未入力' unless object.birth
    object.sex == 0 ? '男性' : '女性'
  end
end
