require 'spec_helper'

describe UserDecorator do
  let(:user_instance) { described_class.new(user) }
  let(:user) { FactoryGirl.create(:user) }

  describe 'user' do
    describe '#age' do
      it 'return age of its birth' do
        expect(user_instance.age).to eq("#{(DateTime.now.to_date - user.birth).to_i / 365}歳")
      end
    end

    describe '#sex' do
      it 'sexが0のとき' do
        expect(user_instance.sex).to eq('男性')
      end
    end
  end

  let(:admin_instance) { described_class.new(admin) }
  let(:admin) { FactoryGirl.create(:admin) }

  describe 'admin' do
    describe '#age' do
      it 'return age of its birth' do
        expect(admin_instance.age).to eq("#{(DateTime.now.to_date - admin.birth).to_i / 365}歳")
      end
    end

    describe '#sex' do
      it 'sexが0のとき' do
        expect(admin_instance.sex).to eq('女性')
      end
    end
  end
end
