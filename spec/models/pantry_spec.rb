require 'rails_helper'

RSpec.describe Pantry, type: :model do
  before do
    @pantry = FactoryBot.build(:pantry)
  end

  describe 'パントリー新規登録' do
    context '内容に問題ない場合' do
      it 'name,descriptionが存在すれば登録できる' do
        expect(@pantry).to be_valid
      end
      it 'descriptionがなくても登録できる' do
        @pantry.description = ''
        expect(@pantry).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'nameが空だと登録できない' do
        @pantry.name = ''
        @pantry.valid?
        expect(@pantry.errors.full_messages).to include("Name can't be blank")
      end
      it 'userが紐付いていないと登録できない' do
        @pantry.user = nil
        @pantry.valid?
        expect(@pantry.errors.full_messages).to include('User must exist')
      end
    end
  end
end
