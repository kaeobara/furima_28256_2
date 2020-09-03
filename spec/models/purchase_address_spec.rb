require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  
  before do
    @purchase = FactoryBot.build(:purchase_address)
  end

  describe '商品購入について' do
    context '商品購入ができるとき' do
      it 'postal_code、prefecture_id、city、house_number、phone＿number、user_id、item＿id、tokenがあれば購入できる' do
        expect(@purchase).to be_valid
      end

      it '郵便番号が３桁-４桁だと購入できる' do
        @purchase.postal_code = '123-4567'
        expect(@purchase).to be_valid
      end
 
      it '電話番号が11桁以内だと購入できる' do
        @purchase.phone_number = '12345678912'
        expect(@purchase).to be_valid
      end

      it 'building_nameがからでも購入できる' do
        @purchase.building_name = ''
        expect(@purchase).to be_valid
      end
    end

    context '購入ができないとき' do
      it 'postal_codeが空だと購入できない' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idが空だと購入できない' do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと購入できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと購入できない' do
        @purchase.house_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'user_idが空だと購入できない' do
        @purchase.user_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @purchase.item_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空だと購入できない' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'phone_numberが12桁以上だと購入できない' do
        @purchase.phone_number = '123456789123'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'postal_codeに-がないと購入できない' do
        @purchase.postal_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeの-の位置が違うと購入できない' do
        @purchase.postal_code = '12-34567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end

      it 'phone_numberに-があると購入できない' do
        @purchase.phone_number = '090-1234-5678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end

    end
  end
end
