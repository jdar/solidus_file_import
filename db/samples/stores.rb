stores = [
  {
    name: "Sample Store",
    code: "sample-store",
    url: "solidus.example.com",
    mail_from_address: "store@example.com",
  }
]

#Previously was: 'Spree::Variant.create!(variants)'
for store in stores 
  found = Spree::Store.find_by_code(store[:code])
  if found
    found.update_attributes(store) 
  else
    Spree::Store.create!(store)
  end
end