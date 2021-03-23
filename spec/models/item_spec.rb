require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品できる時' do
      it 'name,introduce,category_id,state_id,shipping_id,region_id,day_id,price,があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない時' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明がないと出品できない' do
        @item.introduce = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduce can't be blank")
      end

      it 'カテゴリー情報がないと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品状態についての情報がないと出品できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end

      it '配送料の負担についての情報がないと出品できない' do
        @item.shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping must be other than 1')
      end

      it '発送元の地域についての情報がないと出品できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Region must be other than 1')
      end

      it '販売価格についての情報がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が¥299以下だと出品できない' do
        @item.price = '250'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end

      it '販売価格が¥10000000以上だと出品できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end

      it '販売価格はが角数字で入力されていない時出品できない' do
        @item.state_id = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('State is not a number')
      end

      it 'ユーザーが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
