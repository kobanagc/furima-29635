require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it '全てのカラムが正常であれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end

      it 'condition_idが1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end

      it 'payment_for_shipping_idが空では登録できない' do
        @item.payment_for_shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Payment for shipping is not a number')
      end

      it 'payment_for_shipping_idが1では登録できない' do
        @item.payment_for_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Payment for shipping must be other than 1')
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end

      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'number_of_day_idが空では登録できない' do
        @item.number_of_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Number of day is not a number')
      end

      it 'number_of_day_idが1では登録できない' do
        @item.number_of_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Number of day must be other than 1')
      end

      it 'priceが半角数字以外では登録できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが全角数字では登録できない' do
        @item.price = '９９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが9999999円より高いと登録できない' do
        @item.price = 999999999
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが300円より安いと登録できない' do
        @item.price = 2
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
    end
  end
end
