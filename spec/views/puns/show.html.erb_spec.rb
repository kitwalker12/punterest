require 'rails_helper'

RSpec.describe "puns/show", :type => :view do
  before(:each) do
    @pun = assign(:pun, Pun.create!(
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
