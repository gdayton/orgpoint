require 'rails_helper'

RSpec.describe "activities/show", type: :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      :user => nil,
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Content/)
  end
end
