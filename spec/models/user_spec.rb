require 'rails_helper'

RSpec.describe User, type: :model do
  
  
  
  before do
    @user = FactoryBot.build(:user)
  end
  
  
  describe 'ユーザー新規登録' do
    
    context '新規登録できる場合'do
      it 'nicknameとemail,password,password_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
      end
    end
    
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない'do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end
    
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
    
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが半角英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end

      it 'passwordが全角入力では登録できない' do
        @user.password = '全角パスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end

      

      it '名前は空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '名前は半角英字のみでは登録できない' do
        @user.first_name = '1a'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角 (漢字, ひらがな, カタカナ)で入力して下さい")
      end
      
      it '名前は空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名前は半角英数字のみでは登録できない' do
        @user.last_name = '2b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角 (漢字, ひらがな, カタカナ)で入力して下さい")
      end



      it '生年月日の入力が空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password =  Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation =  @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    end
 end
end
