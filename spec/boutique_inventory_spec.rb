# frozen_string_literal: true

require 'boutique_inventory'

RSpec.describe BoutiqueInventory do
  let(:subject) { BoutiqueInventory.new(inventory) }

  let(:inventory) do
    [
      { price: 65.00, name: "Maxi Brown Dress", quantity_by_size: { s: 3, m: 7, l: 8, xl: 4 } },
      { price: 50.00, name: "Red Short Skirt", quantity_by_size: {} },
      { price: 29.99, name: "Black Short Skirt", quantity_by_size: { s: 1, xl: 4 } },
      { price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: { s: 7, m: 2 } }
    ]
  end

  describe '#item_names' do
    let(:array_item_names) { ["Bamboo Socks Cats", "Black Short Skirt", "Maxi Brown Dress", "Red Short Skirt"] }

    it 'returns a list of the item names ordered alphabetically' do
      expect(subject.item_names).to eq(array_item_names)
    end
  end

  describe '#cheap' do
    let(:cheap_items) do
      [
        { price: 29.99, name: "Black Short Skirt", quantity_by_size: { s: 1, xl: 4 } },
        { price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: { s: 7, m: 2 } }
      ]
    end

    it 'returns any items that cost less than $30' do
      expect(subject.cheap).to eq(cheap_items)
    end
  end

  describe '#out_of_stock' do
    let(:no_stock) { [{ price: 50.00, name: "Red Short Skirt", quantity_by_size: {} }] }

    it 'returns any items that have no stock' do
      expect(subject.out_of_stock).to eq(no_stock)
    end
  end

  describe '#stock_for_item' do
    let(:name) { "Black Short Skirt" }

    it 'returns the stock of an item by its name' do
      expect(subject.stock_for_item(name)).to eq({ s: 1, xl: 4 })
    end
  end

  describe '#total_stock' do
    it 'calculates the total amount of items in your storeroom:' do
      expect(subject.total_stock).to eq(36)
    end
  end
end
