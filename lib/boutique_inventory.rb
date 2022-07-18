# frozen_string_literal: true

class BoutiqueInventory
  attr_reader :inventory

  def initialize(inventory)
    @inventory = inventory
  end

  def item_names
    inventory.map { |n| n[:name] }.sort
  end

  def cheap
    cheap_items = []

    inventory.map do |p|
      p[:price] < 30 ? cheap_items << p : next
    end

    cheap_items
  end

  def out_of_stock
    no_stock = []

    inventory.map do |stock|
      stock[:quantity_by_size].empty? ? no_stock << stock : next
    end

    no_stock
  end

  def stock_for_item(name)
    stock_for_item_name = inventory.find do |stock|
      stock[:name] == name ? stock[:quantity_by_size] : next
    end

    stock_for_item_name[:quantity_by_size]
  end

  def total_stock
    stock_array = inventory.map do |stock|
      stock[:quantity_by_size].values.sum
    end

    stock_array.sum
  end
end
