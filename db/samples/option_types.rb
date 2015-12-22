opt_types = [
  {
    :name => "tshirt-size",
    :presentation => "Size",
    :position => 1
  },
  {
    :name => "tshirt-color",
    :presentation => "Color",
    :position => 2
  }
]

for opt_type in opt_types 
  found = Spree::OptionType.find_by_presentation(opt_type[:presentation])
  if found
    found.update_attributes(opt_type) 
  else
    Spree::OptionType.create!(opt_type)
  end
end
