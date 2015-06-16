class UserDecorator < Draper::Decorator
  delegate_all

  def name
    return '未入力' if object.name.empty?
    object.name
  end

  def last_sign_in_at
    return '未ログイン' unless object.last_sign_in_at
    object.last_sign_in_at.strftime('%Y/%m/%d %H:%M')
  end

  def age
    return '未入力' unless object.birth
    "#{(DateTime.now.to_date - object.birth).to_i / 365}歳"
  end

  def sex
    return '未入力' unless object.sex
    object.sex == 0 ? '男性' : '女性'
  end
end
