require 'rails_helper'

RSpec.describe "puns/new", :type => :view do
  before(:each) do
    assign(:pun, Pun.new(
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders new pun form" do
    render

    assert_select "form[action=?][method=?]", puns_path, "post" do

      assert_select "textarea#pun_body[name=?]", "pun[body]"

      assert_select "input#pun_user_id[name=?]", "pun[user_id]"
    end
  end
end
