require 'rails_helper'

RSpec.describe "websites/new", :type => :view do
  before(:each) do
    assign(:website, Website.new(
      :owner => "MyString",
      :link => "MyString",
      :desc => "MyText"
    ))
  end

  it "renders new website form" do
    render

    assert_select "form[action=?][method=?]", websites_path, "post" do

      assert_select "input#website_owner[name=?]", "website[owner]"

      assert_select "input#website_link[name=?]", "website[link]"

      assert_select "textarea#website_desc[name=?]", "website[desc]"
    end
  end
end
