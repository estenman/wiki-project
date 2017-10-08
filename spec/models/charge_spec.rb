require 'rails_helper'

RSpec.describe Charge, type: :model do
  let(:user) { create(:user) }
  let(:charge) { create(:charge) }

  it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it "has a value for premium_paid" do
      expect(factory_charge).to have_attributes(premium_paid: charge.premium_paid)
    end
  end

  describe "charging" do
    before do
      @charge.premium_paid = true
    end

    it "sets the value of premium_paid to true" do
      expect(charge.premium_paid).to eq(true)
    end
  end
end
