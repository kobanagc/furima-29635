require 'rails_helper'
describe UserPurchase do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '全てのカラムが正常であれば購入できる' do
        expect(@user_purchase).to be_valid
      end

      it '建物名が空でも購入できる' do
        @user_purchase.building = ""
        expect(@user_purchase).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'カード情報が空では購入できない' do
        @user_purchase.token = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では購入できない' do
        @user_purchase.postal_cord = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Postal cord is invalid')
      end

      it '郵便番号にハイフンがないと購入できない' do
        @user_purchase.postal_cord = '1234567'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Postal cord is invalid')
      end

      it '都道府県が空では購入できない' do
        @user_purchase.prefecture_id = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県が1では購入できない' do
        @user_purchase.prefecture_id = 1
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が空では購入できない' do
        @user_purchase.city = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できない' do
        @user_purchase.block = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号が空では購入できない' do
        @user_purchase.tell = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Tell can't be blank")
      end

      it '電話番号が数字以外では購入できない' do
        @user_purchase.tell = 'あああ'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Tell is invalid')
      end

      it '電話番号が半角数字10桁もしくは11桁でなければ購入できない' do
        @user_purchase.tell = "123456789012"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Tell is invalid')
      end

      it 'item_idが空では登録できない' do
        @user_purchase.item_id = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空では登録できない' do
        @user_purchase.user_id = ""
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("User can't be blank")
      end

    end
  end
end
