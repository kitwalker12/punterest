require 'rails_helper'

RSpec.describe "puns/edit", :type => :view do
  before(:each) do
    @pun = assign(:pun, Pun.create!(
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders the edit pun form" do
    render

    assert_select "form[action=?][method=?]", pun_path(@pun), "post" do

      assert_select "textarea#pun_body[name=?]", "pun[body]"

      assert_select "input#pun_user_id[name=?]", "pun[user_id]"
    end
  end
end
