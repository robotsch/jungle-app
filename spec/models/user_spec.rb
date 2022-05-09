require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save properly when all fields are valid' do
      @user = User.create(name: "Test", email: "TEST1@TEST.com", password: "password", password_confirmation: "password")

      expect(@user).to be_valid
    end

    it 'should not save when password_confirmation does not match password' do
      @user = User.create(name: "Test", email: "TEST1@TEST.com", password: "password", password_confirmation: "Password")

      expect(@user).to_not be_valid
    end

    it 'should have a unique email' do
      @user1 = User.create(name: "Test", email: "TEST1@TEST.com", password: "password", password_confirmation: "password")
      @user2 = User.create(name: "Test", email: "TEST1@TEST.com", password: "password", password_confirmation: "password")

      expect(@user2).to_not be_valid
    end
  end

  
  describe '.authenticate_with_credentials' do
    it 'should return nil with the wrong password' do
      @user = User.create(name: "Test", email: "TEST@TEST.com", password: "Password", password_confirmation: "Password")
      @auth_user = @user.authenticate_with_credentials("TEST@TEST.com", "Pa55word")
      expect(@auth_user).to eq(nil)
    end

    it 'should successfully authenticate with extra spaces' do
      @user = User.create(name: "Test", email: "TEST@TEST.com", password: "Password", password_confirmation: "Password")
      @auth_user = @user.authenticate_with_credentials("  TEST@TEST.com  ", "Password")
      expect(@auth_user).to_not eq(nil)
    end
  end
end