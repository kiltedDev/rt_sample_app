require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before(:each) do
    @bob = create(:user)
    @medeiros = create(:user, :major)
    @rel = Relationship.new(followed_id: @bob.id, follower_id: @medeiros.id)
  end

  it "is a valid model" do
    expect(@rel).to be_valid
  end

  it "should require a follower_id" do
    @rel.follower_id = nil
    expect(@rel).to_not be_valid
  end

  it "should require a followed_id" do
    @rel.followed_id = nil
    expect(@rel).to_not be_valid
  end
end
