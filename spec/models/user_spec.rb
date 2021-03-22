require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できる時' do
      it 'nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない時' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空だと登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it '登録済みメールアドレスだと登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it 'メールアドレスに＠を含んでいないと登録できない' do
          @user.email = 'test.email'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it 'passwordが空だと登録できない' do
          @user.password = ''
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが５文字以下だと登録できない' do
          @user.password = 'test1'
          @user.password_confirmation = 'test1'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it 'passwordが数字のみだと登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it 'passwordが半角英数混合で入力されないと登録できない' do
          @user.password = 'testtest'
          @user.password_confirmation = 'testtest'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = 'test123'
          @user.password_confirmation = 'test1234'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'first_nameが空だと登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'first_nameが全角でないと登録できない' do
          @user.first_name = 'ﾃｽﾄ'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end

        it 'last_nameが空だと登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'last_nameが全角でないと登録できない' do
          @user.last_name = 'ﾃｽﾄ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end

        it 'first_name_kanaが空だと入力できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it 'first_name_kanaが全角(カタカナ)ないと登録できない' do
          @user.first_name_kana = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end

        it 'last_name_kanaが空だと入力できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it 'last_name_kanaが全角(カタカナ)ないと登録できない' do
          @user.last_name_kana = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end

        it '生年月日が空だと登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
  end
end
