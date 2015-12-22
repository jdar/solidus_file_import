Solidus::FileImport.import_file("addresses")
Solidus::FileImport.import_file("stores")

payment_method = Spree::PaymentMethod::Check.first!
store = Spree::Store.first!

orders = []
orders << Spree::Order.create!(
  :number => "R123456789",
  :email => "spree@example.com",
  :item_total => 150.95,
  :adjustment_total => 150.95,
  :total => 301.90,
  :shipping_address => Spree::Address.first,
  :billing_address => Spree::Address.last)

orders << Spree::Order.create!(
  :number => "R987654321",
  :email => "spree@example.com",
  :item_total => 15.95,
  :adjustment_total => 15.95,
  :total => 31.90,
  :shipping_address => Spree::Address.first,
  :billing_address => Spree::Address.last)

orders[0].line_items.create!(
  :variant => Spree::Product.find_by_name!("Ruby on Rails Tote").master,
  :quantity => 1,
  :price => 15.99)

orders[1].line_items.create!(
  :variant => Spree::Product.find_by_name!("Ruby on Rails Bag").master,
  :quantity => 1,
  :price => 22.99)

orders.each do |order|
  order.payments.create!(payment_method: payment_method)
  order.update_attributes(store: store)

  order.next! while !order.can_complete?
  order.complete!
end
