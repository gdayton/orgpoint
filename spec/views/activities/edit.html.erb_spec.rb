require 'rails_helper'

RSpec.describe "activities/edit", type: :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      :user => nil,
      :content => "MyString"
    ))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do

      assert_select "input#activity_user_id[name=?]", "activity[user_id]"

      assert_select "input#activity_content[name=?]", "activity[content]"
    end
  end
end
