require 'rails_helper'

RSpec.describe "statements/new", type: :view do
  before(:each) do
    assign(:statement, Statement.new(
      :company => nil,
      :amount => ""
    ))
  end

  it "renders new statement form" do
    render

    assert_select "form[action=?][method=?]", statements_path, "post" do

      assert_select "input#statement_company_id[name=?]", "statement[company_id]"

      assert_select "input#statement_amount[name=?]", "statement[amount]"
    end
  end
end
