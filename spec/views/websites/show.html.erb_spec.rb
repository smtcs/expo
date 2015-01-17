require 'rails_helper'

RSpec.describe "websites/show", :type => :view do
  before(:each) do
    @website = assign(:website, Website.create!(
      :owner => "Owner",
      :link => "Link",
      :desc => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Owner/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/MyText/)
  end
end
