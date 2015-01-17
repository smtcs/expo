require 'rails_helper'

RSpec.describe "websites/edit", :type => :view do
  before(:each) do
    @website = assign(:website, Website.create!(
      :owner => "MyString",
      :link => "MyString",
      :desc => "MyText"
    ))
  end

  it "renders the edit website form" do
    render

    assert_select "form[action=?][method=?]", website_path(@website), "post" do

      assert_select "input#website_owner[name=?]", "website[owner]"

      assert_select "input#website_link[name=?]", "website[link]"

      assert_select "textarea#website_desc[name=?]", "website[desc]"
    end
  end
end
