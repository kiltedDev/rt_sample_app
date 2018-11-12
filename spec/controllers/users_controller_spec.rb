require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:each) do
    @bob = create(:user)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH edit/update" do
    it "does not allow admin to be edited from the web" do
      form_params = {
        id: @bob.id,
        user: @bob,
        admin: 1
      }
      patch :update, params: form_params
      
      @bob.reload
      expect(@bob.admin).to eq(false)
    end
  end
end
