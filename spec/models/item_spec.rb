require 'rails_helper'

RSpec.describe Item, type: :model do


  describe '商品を出品できないとき' do
    before do
    @item = FactoryBot.build(:item)
  end

    it '商品名が空だと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空だと出品できない' do
      @item.introduction = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end

    it 'カテゴリーが選択されていないと出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態が選択されていないと出品できない' do
      @item.item_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end

    it '配送料の負担が選択されていないと出品できない' do
      @item.postage_payer_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer can't be blank")
    end

    it '発送元の地域が選択されていないと出品できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数が選択されていないと出品できない' do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end

    it '商品の価格が空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '商品の価格が¥300未満だと出品できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end

    it '商品の価格が¥9,999,999より高いと出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end

    it '商品の価格が文字列の場合は出品できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '商品の名前が40文字を超えていると出品できない' do
      @item.name = 'a' * 41
      @item.valid?
      expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end

    it '商品の説明が1000文字を超えていると出品できない' do
      @item.introduction = 'a' * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction is too long (maximum is 1000 characters)")
    end

    it '商品の画像がないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

      
  end

  describe '商品が出品できるとき' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it '画像と、商品名と、商品の説明と、カテゴリーと、商品の状態と、配送料の負担と、発送元の地域と、発送までの日数と、商品の価格と、ユーザーが存在すれば出品できる' do
      @item.valid?
      expect(@item).to be_valid
    end

  end
end
