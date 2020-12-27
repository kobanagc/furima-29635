require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = User.new(family_name: "あああ",first_name: "いいい",family_name_kana: "アアア",first_name_kana: "イイイ",birth_day: "1990-05-05", nick_name: "test", email: "test@test", password: "Ab0000", password_confirmation: "Ab0000")
    end

    context '新規登録がうまくいくとき' do
      it "全てのカラムが正常であれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nick_nameが空では登録できない" do
        @user.nick_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end

      it "emailが空では登録できない" do
        @user = User.new(nick_name: "test", email: "", password: "000000", password_confirmation: "000000")
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "既存emailは登録できない" do
        @user.save
        user2 = User.new(family_name: "あああ",first_name: "いいい",family_name_kana: "アアア",first_name_kana: "イイイ",birth_day: "1990-05-05", nick_name: "test", email: "test@test", password: "Ab0000", password_confirmation: "Ab0000")
        user2.valid?
        expect(user2.errors.full_messages).to include("Email has already been taken")
      end

      it "@を含まないemailは登録できない" do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下では登録できない" do
        @user.password = "Ab000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英数混合でなければ登録できない" do
        @user.password = "A00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "password_confirmationがpaswordと同じでなければ登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "family_nameが空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "family_nameが半角では登録できない" do
        @user.family_name = "AAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name must be zenkaku")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameが半角では登録できない" do
        @user.first_name = "BBB"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name must be zenkaku")
      end

      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it "family_name_kanaが全角カナ以外では登録できない" do
        @user.family_name_kana = "AAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana must be zenkaku")
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "first_name_kanaが全角カナ以外では登録できない" do
        @user.first_name_kana = "BBB"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana must be zenkaku")
      end

      it "birth_dayが空では登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

    end
  end
end
