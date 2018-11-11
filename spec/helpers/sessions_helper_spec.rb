require 'rails_helper'

describe SessionsHelper do
  before(:each) do
    @bob = create(:user)
    remember(@bob)
  end

  describe "#current_user" do
    it "returns correct user when session is nil" do
      expect(current_user).to eq(@bob)
    end

    it "returns nil when remember digest is wrong" do
      @bob.update_attribute(:remember_digest, User.digest(User.new_token))
      expect(current_user).to eq(nil)
    end
  end
end
