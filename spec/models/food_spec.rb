require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @food = FactoryBot.build(:food)
  end

  describe 'フード新規登録' do
    context '内容に問題ない場合' do
      it 'name,purchase_day,limit_dayが存在すれば登録できる' do
        expect(@food).to be_valid
      end
      it 'limit_dayがなくても登録できる' do
        @food.limit_day = ''
        expect(@food).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'nameが空だと登録できない' do
        @food.name = ''
        @food.valid?
        expect(@food.errors.full_messages).to include('Foodの名称を入力してください')
      end
      it 'pantryが紐付いていないと登録できない' do
        @food.pantry = nil
        @food.valid?
        expect(@food.errors.full_messages).to include('Pantryを入力してください')
      end
    end
  end
end
