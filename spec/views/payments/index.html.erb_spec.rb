require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        total: 2,
        references: ""
      ),
      Payment.create!(
        total: 2,
        references: ""
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
