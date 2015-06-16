require 'rails_helper'

RSpec.describe Physical, type: :model do
  context 'PhiscalはUserに所属している' do
    it 'belongs_to: users' do
      is_expected.to belong_to(:user)
    end
  end
end
