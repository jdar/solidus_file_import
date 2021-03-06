Solidus::FileImport.import_file("tax_categories")
Solidus::FileImport.import_file("shipping_categories")

tax_category = Spree::TaxCategory.find_by_name!("Default")
shipping_category = Spree::ShippingCategory.find_by_name!("Default")

default_attrs = {
  description: Faker::Lorem.paragraph,
  available_on: Time.current
}

products = [
  {
    :name => "Ruby on Rails Tote",
    :tax_category => tax_category,
    :shipping_category => shipping_category,
    :price => 15.99,
    :eur_price => 14,
  },
  {
    :name => "Ruby on Rails Bag",
    :tax_category => tax_category,
    :shipping_category => shipping_category,
    :price => 22.99,
    :eur_price => 19,
  },
  {
    :name => "Ruby on Rails Baseball Jersey",
    :tax_category => tax_category,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16
  },
  {
    :name => "Ruby on Rails Jr. Spaghetti",
    :tax_category => tax_category,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16

  },
  {
    :name => "Ruby on Rails Ringer T-Shirt",
    :shipping_category => shipping_category,
    :tax_category => tax_category,
    :price => 19.99,
    :eur_price => 16
  },
  {
    :name => "Ruby Baseball Jersey",
    :tax_category => tax_category,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16
  },
  {
    :name => "Apache Baseball Jersey",
    :tax_category => tax_category,
    :shipping_category => shipping_category,
    :price => 19.99,
    :eur_price => 16
  },
  {
    :name => "Ruby on Rails Mug",
    :shipping_category => shipping_category,
    :price => 13.99,
    :eur_price => 12
  },
  {
    :name => "Ruby on Rails Stein",
    :shipping_category => shipping_category,
    :price => 16.99,
    :eur_price => 14
  }
]
require 'csv'
csv_path = "tmp/products.csv"
binding.pry
CSV.open(csv_path,header: products.first.keys) do |csv|
  products.each{ csv << products.values }
end


searchable_products = []
CSV.open(csv_path) do |product_attrs|
  product_attrs = product_attrs.to_hash
  eur_price = product_attrs.delete(:eur_price)
  Spree::Config[:currency] = "USD"

  product = Spree::Product.create!(default_attrs.merge(product_attrs))
  Spree::Config[:currency] = "EUR"
  product.reload
  product.price = eur_price
  product.shipping_category = shipping_category
  product.save!
  searchable_products << product
end

Spree::Product.update_all(:unsearchable=>true)
Spree::Product.where(id: searchable_products.map(&:id)).update(:unsearchable=>false)


Spree::Config[:currency] = "USD"
