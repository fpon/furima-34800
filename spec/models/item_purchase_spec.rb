require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase = FactoryBot.build(:item_purchase, user_id: user.id, item_id: item.id)
      sleep 0.01
    end

    context '商品が購入できる時' do
      it '全て項目の記述条件を満たしていれば購入できる' do
        expect(@purchase).to be_valid
      end

      it 'building_nameがなくても登録できる' do
        @purchase.building_name = ''
        expect(@purchase).to be_valid
      end
    end
    
    context '商品が購入できない時' do
      it "user_idが空では登録できないこと" do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("ユーザーを入力してください")
      end
      
      it "item_idが空では登録できないこと" do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("商品を入力してください")
      end
      
      it "tokenが空では登録できないこと" do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      
      it 'postが空の時、購入できない' do
        @purchase.post = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("郵便番号を入力してください")
      end
      
      it 'postにハイフンがない時、購入できない' do
        @purchase.post = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("郵便番号は不正な値です")
      end
      
      it 'postのハイフンまでの数字の個数が３つ以外の時、購入できない' do
        @purchase.post = '12-4567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("郵便番号は不正な値です")
      end
      
      it 'postのはハイフン後の数字の個数が４つ以外の時、購入できない' do
        @purchase.post = '123-456'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("郵便番号は不正な値です")
      end
      
      it 'postに数字以外の記入がある時、購入できない' do
        @purchase.post = '123-ああああ'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("郵便番号は不正な値です")
      end
      
      it 'postが全角数字の時、購入できない' do
        @purchase.post = '１２３-４５６７'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("郵便番号は不正な値です")
      end
      
      it 'region_idが1の時、購入できない' do
        @purchase.region_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("都道府県を選択してください")
      end
      
      it 'house_numberが空の時、購入できない' do
        @purchase.house_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("番地を入力してください")
      end
      
      it 'phone_numberが空の時、購入できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("電話番号を入力してください")
      end
      
      it 'phone_numberが12桁以上の時、購入できない' do
        @purchase.phone_number = '123456789012'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end
      
      it 'phone_numberに数字以外の記入がある時、購入できない' do
        @purchase.phone_number = 'aaaaaaaaaaa'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("電話番号は不正な値です")
      end
      
      it 'phone_numberに全角数字の時、購入できない' do
        @purchase.phone_number = '１２３４５６７８９０'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end


