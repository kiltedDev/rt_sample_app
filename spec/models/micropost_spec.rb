require 'rails_helper'

RSpec.describe Micropost, type: :model do
  before(:each) do
    @bob = create(:user)
    @micropost = create(:micropost, user: @bob)
  end

  it "is a valid model" do
    expect(@micropost).to be_valid
  end

  it "is not a valid model without a user" do
    @micropost.user_id = nil
    expect(@micropost).to_not be_valid
  end

  it "is not a valid model without content" do
    @micropost.content = nil
    expect(@micropost).to_not be_valid
  end

  it "is sorted with most recent first" do
    10.times do |n|
      create(:micropost, user: @bob, created_at: n.hours.ago)
    end
    most_recent = create(:micropost, user: @bob, created_at: 1.hour.from_now)
    expect(most_recent).to eq(Micropost.first)
  end

  it "is destoyed when it's user is" do
    expect(Micropost.count).to eq(1)
    @bob.destroy
    expect(Micropost.count).to eq(0)
  end
end
