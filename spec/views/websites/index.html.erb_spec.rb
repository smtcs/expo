require 'rails_helper'

RSpec.describe "websites/index", :type => :view do
  before(:each) do
    assign(:websites, [
      Website.create!(
        :owner => "Owner",
        :link => "Link",
        :desc => "MyText"
      ),
      Website.create!(
        :owner => "Owner",
        :link => "Link",
        :desc => "MyText"
      )
    ])
  end

  it "renders a list of websites" do
    render
    assert_select "h2", :text => "Owner".to_s, :count => 2
  end
end
