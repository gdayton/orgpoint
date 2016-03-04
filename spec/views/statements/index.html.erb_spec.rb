require 'rails_helper'

RSpec.describe "statements/index", type: :view do
  before(:each) do
    assign(:statements, [
      Statement.create!(
        :company => nil,
        :amount => ""
      ),
      Statement.create!(
        :company => nil,
        :amount => ""
      )
    ])
  end

  it "renders a list of statements" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
