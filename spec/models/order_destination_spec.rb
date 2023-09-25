require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
     @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
    end
  
    describe '商品購入情報の保存' do
      context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_destination.building_name = nil
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_numberが空だと保存できないこと' do
        @order_destination.post_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post number is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'post_numberにハイフンがないと保存できないこと' do
        @order_destination.post_number = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post number is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'post_numberのハイフンは4番目にないと保存できないこと' do
        @order_destination.post_number = '1234-567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post number is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが1だと保存できないこと' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @order_destination.municipality = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @order_destination.street_address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角では登録できないこと' do
        @order_destination.phone_number = '０９０１２３４５６７８'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberに文字があると登録できないこと' do
        @order_destination.phone_number = '0901234567a'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが10文字未満では登録できないこと' do
        @order_destination.phone_number = '090123456'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is too short")
      end
      it 'tokenが空だと保存できないこと' do
        @order_destination.token = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
