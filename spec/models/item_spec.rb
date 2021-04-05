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
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の画像を入力してください")
      end
      
      it '商品名がないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      
      it '商品説明がないと出品できない' do
        @item.introduce = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      
      it 'カテゴリー情報がないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      
      it '商品状態についての情報がないと出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      
      it '配送料の負担についての情報がないと出品できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      
      it '発送元の地域についての情報がないと出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      
      it '販売価格についての情報がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      
      it '販売価格が¥299以下だと出品できない' do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は299より大きい値にしてください")
      end
      
      it '販売価格が¥10000000以上だと出品できない' do
        @item.price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は10000000より小さい値にしてください")
      end
      
      it '販売価格はが半角数字で入力されていない時出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      
      it '商品価格が半角英数字混合では出品できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      
      it '商品価格が半角英字のみでは出品できない' do
        @item.price = '3000a'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      
      it 'ユーザーが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
