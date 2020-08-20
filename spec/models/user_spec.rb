require 'rails_helper'
describe User, type: :model do

  describe 'ユーザー新規登録ができないとき' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "familiy_nameが空だと登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_name_kanaが空だと登録できない"do
    @user.first_name_kana = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "birth_dayが空だと登録できない" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it "first_nameが半角だと登録できない" do
      @user.first_name = "p"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 正しい名前を入力してください")
    end
    it "family_nameが半角だと登録できない" do
      @user.family_name = "p"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 正しい名前を入力してください")
    end
    it "first_name_kanaが英数字だと登録できない" do
      @user.first_name_kana = "p0"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana カタカナで入力してください")
    end
    it "family_name_kanaが英数字だと登録できない" do
      @user.family_name_kana = "p0"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana カタカナで入力してください")
    end
    it "emailに@が入ってないと登録できない" do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "emailが重複してると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが半角数字だけだと登録できない" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数混合で入力してください")
    end
    it "passwordが半角英語だけだと登録できない" do
      @user.password = "pppppp"
      @user.password_confirmation = "pppppp"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数混合で入力してください")
    end
    it "passwordが5文字以下だと登録できない" do
      @user.password = "123pp"
      @user.password_confirmation = "123pp"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe 'ユーザー新規登録ができるとき' do
    it "nicknameとfirst_nameとfamily_nameとfirst_name_kanaとfamily_name_kanaとemailとpasswordとpassword_confirmationとbirth_dayが存在すると登録できる" do
      expect(@user).to be_valid
    end
    it "passwordが6文字以上の英数混合であれば登録できる" do
      @user.password = "000ppp"
      @user.password_confirmation = "000ppp"
      expect(@user).to be_valid
    end
    it "お名前は全角（漢字、ひらがな、カタカナ）で入力すると登録できる" do
      @user.first_name = "佳かカ"
      @user.family_name = "佳かカ"
      expect(@user).to be_valid
    end
    it "お名前カナは全角（カナ）で入力すると登録できる" do
      @user.first_name_kana = "カタカナ"
      @user.family_name_kana = "カタカナ"
      expect(@user).to be_valid
    end
 end
end
