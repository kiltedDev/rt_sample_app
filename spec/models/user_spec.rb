require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @bob = create(:user)
  end

  it "is a valid model" do
    expect(@bob).to be_valid
  end

  it "is not valid without a valid name" do
    @bob.name = "     "
    expect(@bob).to_not be_valid
  end

  it "is not valid without a valid email address" do
    @bob.email = "     "
    expect(@bob).to_not be_valid
  end

  it "is not valid without a valid password" do
    bob = User.new(name:"Bob Johansson", email: "the.bob@bob.net")
  end

  it "is not valid with too long a name" do
  @bob.name = "a" * 51
  expect(@bob).to_not be_valid
  end

  it "is not valid with too long a email" do
    @bob.email = "a" * 244 + "@example.com"
    expect(@bob).to_not be_valid
  end

  it "is valid with a properly formatted email" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
    first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @bob.email = valid_address
      expect(@bob).to be_valid
    end
  end

  it "is not valid with an improperly formatted email" do
    invalid_addresses = %w[Bill USER@foo A_US-ER&foo.bar.org
    first.last@foo,jp alice@bob+baz.cn bob@bob..com]
    invalid_addresses.each do |invalid_address|
      @bob.email = invalid_address
      expect(@bob).to_not be_valid
    end
  end

  it "is not valid if an email address is already on file" do
    duped_user = @bob.dup
    duped_user.email = duped_user.email.upcase
    @bob.save
    expect(duped_user).to_not be_valid
  end

  it "saves email addresses as lower cast" do
    gamzee_email = "UsEr@ExAmPlE.cOm"
    @bob.email = gamzee_email
    @bob.save
    expect(@bob.email).to eq(@bob.reload.email)
  end

  it "is not valid with a blank password" do
    @bob.password = @bob.password_confirmation = "      "
    expect(@bob).to_not be_valid
  end

  it "is not valid with a too short password" do
    @bob.password = @bob.password_confirmation = "1234567"
    expect(@bob).to_not be_valid
  end

  it "is not valid with a too long password" do
    @bob.password = @bob.password_confirmation = "x" * 65
    expect(@bob).to_not be_valid
  end

  it "is not authenticated with a nil digest" do
    expect(@bob.authenticated?(:remember, '')).to be(false)
  end

  it "is able to follow and unfollow a user" do
    medeiros = create(:user, :major)
    expect(@bob.following.count).to eq(0)
    @bob.follow(medeiros)
    expect(@bob.following.count).to eq(1)
    expect(@bob.following?(medeiros)).to be(true)
    expect(medeiros.followers.include?(@bob)).to be(true)
    @bob.unfollow(medeiros)
    expect(@bob.following.count).to eq(0)
  end

  it "has the correct posts in it's feed" do
    @medeiros = create(:user, :major)
    @butterworth = create(:user, :butterworth)
    @bob.follow(@medeiros)

    10.times do
      create(:micropost, user_id: @medeiros.id)
    end

    @medeiros.microposts.each do |post|
      # self
      expect(@medeiros.feed.include?(post)).to be true
      # follower
      expect(@bob.feed.include?(post)).to be true
      # not follower
      expect(@butterworth.feed.include?(post)).to be false
    end
  end
end
