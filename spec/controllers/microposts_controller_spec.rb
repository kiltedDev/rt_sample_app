require 'rails_helper'

RSpec.describe MicropostsController, type: :controller do

  before(:each) do
    @bob = create(:user)
    @mp = create(:micropost, user: @bob)
  end

end
