require 'rails_helper'

RSpec.describe "activities/new", type: :view do
  before(:each) do
    assign(:activity, Activity.new(
      :user => nil,
      :content => "MyString"
    ))
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do

      assert_select "input#activity_user_id[name=?]", "activity[user_id]"

      assert_select "input#activity_content[name=?]", "activity[content]"
    end
  end
end
