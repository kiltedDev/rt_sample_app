require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new( name: "Example User",
                      email: "user@example.com",
                      password: "password",
                      password_confirmation: "password" )
  end

  it "is a valid model" do
    expect(@user).to be_valid
  end

  it "is not valid without a valid name" do
    @user.name = "     "
    expect(@user).to_not be_valid
  end

  it "is not valid without a valid email address" do
    @user.email = "     "
    expect(@user).to_not be_valid
  end

  it "is not valid without a valid password" do
    bob = User.new(name:"Bob Johansson", email: "the.bob@bob.net")
  end

  it "is not valid with too long a name" do
  @user.name = "a" * 51
  expect(@user).to_not be_valid
  end

  it "is not valid with too long a email" do
    @user.email = "a" * 244 + "@example.com"
    expect(@user).to_not be_valid
  end

  it "is valid with a properly formatted email" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
    first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  it "is not valid with an improperly formatted email" do
    invalid_addresses = %w[Bill USER@foo A_US-ER&foo.bar.org
    first.last@foo,jp alice@bob+baz.cn bob@bob..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to_not be_valid
    end
  end

  it "is not valid if an email address is already on file" do
    duped_user = @user.dup
    duped_user.email = duped_user.email.upcase
    @user.save
    expect(duped_user).to_not be_valid
  end

  it "saves email addresses as lower cast" do
    gamzee_email = "UsEr@ExAmPlE.cOm"
    @user.email = gamzee_email
    @user.save
    expect(@user.email).to eq(@user.reload.email)
  end

  it "is not valid with a blank password" do
    @user.password = @user.password_confirmation = "      "
    expect(@user).to_not be_valid
  end

  it "is not valid with a too short password" do
    @user.password = @user.password_confirmation = "1234567"
    expect(@user).to_not be_valid
  end

  it "is not valid with a too long password" do
    @user.password = @user.password_confirmation = "x" * 65
    expect(@user).to_not be_valid
  end
end
