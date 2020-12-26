require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nick_nameが空では登録できない" do
      user = User.new(nick_name: "", email: "test@example", password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors.full_messages).to include("Nick name can't be blank")
    end

    it "emailが空では登録できない" do
      user = User.new(nick_name: "test", email: "", password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "既存emailは登録できない" do
      user1 = User.create(family_name: "あああ",first_name: "いいい",family_name_kana: "アアア",first_name_kana: "イイイ",birth_day: "1990-05-05", nick_name: "test", email: "test@test", password: "Ab0000", password_confirmation: "Ab0000")
      user2 = User.new(family_name: "あああ",first_name: "いいい",family_name_kana: "アアア",first_name_kana: "イイイ",birth_day: "1990-05-05", nick_name: "test", email: "test@test", password: "Ab0000", password_confirmation: "Ab0000")
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it "@を含まないemailは登録できない" do
      user = User.new(nick_name: "test", email: "test", password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できない" do
      user = User.new(nick_name: "test", email: "test@test", password: "", password_confirmation: "")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下では登録できない" do
      user = User.new(nick_name: "test", email: "test", password: "Ab000", password_confirmation: "Ab000")
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英数混合でなければ登録できない" do
      user = User.new(family_name: "あああ",first_name: "いいい",family_name_kana: "アアア",first_name_kana: "イイイ",birth_day: "1990-05-05", nick_name: "test", email: "test@test", password: "A00000", password_confirmation: "A00000")
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end

  end
end
