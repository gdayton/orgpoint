require 'rails_helper'

RSpec.describe "photos/edit", type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :caption => "MyString",
      :user => nil,
      :image => ""
    ))
  end

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do

      assert_select "input#photo_caption[name=?]", "photo[caption]"

      assert_select "input#photo_user_id[name=?]", "photo[user_id]"

      assert_select "input#photo_image[name=?]", "photo[image]"
    end
  end
end
