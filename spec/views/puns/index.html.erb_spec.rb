require 'rails_helper'

RSpec.describe "puns/index", :type => :view do
  before(:each) do
    assign(:puns, [
      Pun.create!(
        :body => "MyText",
        :user => nil
      ),
      Pun.create!(
        :body => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of puns" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
