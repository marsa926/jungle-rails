require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"



  describe "validations" do

    before do
      @user = User.create(first_name: 'Sara', last_name: 'Han', email: 'marsa926@gmail.com', password: '00000', password_confirmation: '00000')
    end


    it "should have valid password/password confirmation" do
      expect(@user.password).to eql(@user.password_confirmation)

    end

    it "must have valid email address" do
      @user1 = User.create(email: 'marsa926@gmail.com')
      expect(@user1.errors[:email]).to include("has already been taken")
      expect(@user.email).to include(@user.email.downcase)
    end

    it "must have valid first/last name" do
      expect(@user.first_name).to be_truthy
      expect(@user.last_name).to be_truthy
    end

    it "must have password length of 4 or greater" do
      expect(@user.password.length).to be >= 4
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user2 = User.create(first_name: 'Bob', last_name: 'Sponge', email:'2@example.com', password: "0000")
      @user3 = User.create(email:'eXample@domain.COM')
    end

    it "valid email with correct password" do
      expect(User.authenticate_with_credentials("2@example.com", "0000")).to eql(@user2)
    end

    it "valid emails with extra spaces" do
      expect(User.authenticate_with_credentials(" 2@example.com ", "0000")).to eql(@user2)
    end

    it "valid email with wrong password" do
      expect(User.authenticate_with_credentials("2@example.com", "0002")).to be_falsy
    end

    it "valid emails with wrong case" do
      expect(User.authenticate_with_credentials("2@ExamPLE.com", "0000")).to eql(@user2)
    end
  end
end



  # validates :email, presence: true, uniqueness: { case_sensitive: false }
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :password, length: {minimum: 4}