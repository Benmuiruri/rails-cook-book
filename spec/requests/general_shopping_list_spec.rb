require 'rails_helper'

RSpec.describe "GeneralShoppingLists", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/general_shopping_list/show"
      expect(response).to have_http_status(:success)
    end
  end

end
