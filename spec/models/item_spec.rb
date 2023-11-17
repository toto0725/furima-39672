require 'rails_helper'


RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品' do

    context '出品できる場合' do

      it '出品情報が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    
    end


    context '出品ができない場合' do

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'categoryが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'conditionが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'feeが空では登録できない' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it 'prefectureが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'deliveryが空では登録できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    
    end
  end
end
