require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:factory_wiki) { create(:wiki) }

  describe "attributes" do
    it "has a title, body, and private value" do
      expect(factory_wiki).to have_attributes(title: factory_wiki.title, body: factory_wiki.body, private: factory_wiki.private)
    end
  end

end
