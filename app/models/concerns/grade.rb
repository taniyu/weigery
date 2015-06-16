module Grade
  extend ActiveSupport::Concern

  ROLE = [['管理者', 100], ['一般', 0]]
  SEX = [['男性', 0], ['女性', 1]]
end
