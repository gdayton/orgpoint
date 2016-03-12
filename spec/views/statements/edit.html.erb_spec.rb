require 'rails_helper'

RSpec.describe "statements/edit", type: :view do
  before(:each) do
    @statement = assign(:statement, Statement.create!(
      :company => nil,
      :amount => ""
    ))
  end

  it "renders the edit statement form" do
    render

    assert_select "form[action=?][method=?]", statement_path(@statement), "post" do

      assert_select "input#statement_company_id[name=?]", "statement[company_id]"

      assert_select "input#statement_amount[name=?]", "statement[amount]"
    end
  end
end
