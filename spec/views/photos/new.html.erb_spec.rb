require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before(:each) do
    assign(:photo, Photo.new(
      :caption => "MyString",
      :user => nil,
      :image => ""
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input#photo_caption[name=?]", "photo[caption]"

      assert_select "input#photo_user_id[name=?]", "photo[user_id]"

      assert_select "input#photo_image[name=?]", "photo[image]"
    end
  end
end
