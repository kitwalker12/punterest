require 'rails_helper'

RSpec.describe "Puns", :type => :request do
  describe "GET /puns" do
    it "works! (now write some real specs)" do
      get puns_path
      expect(response.status).to be(200)
    end
  end
end
