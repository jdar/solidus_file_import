Solidus::FileImport.import_file("option_types")

size = Spree::OptionType.find_by_presentation!("Size")
color = Spree::OptionType.find_by_presentation!("Color")

opts = [
  {
    :name => "Small",
    :presentation => "S",
    :position => 1,
    :option_type => size
  },
  {
    :name => "Medium",
    :presentation => "M",
    :position => 2,
    :option_type => size
  },
  {
    :name => "Large",
    :presentation => "L",
    :position => 3,
    :option_type => size
  },
  {
    :name => "Extra Large",
    :presentation => "XL",
    :position => 4,
    :option_type => size
  },
  {
    :name => "Red",
    :presentation => "Red",
    :position => 1,
    :option_type => color,
  },
  {
    :name => "Green",
    :presentation => "Green",
    :position => 2,
    :option_type => color,
  },
  {
    :name => "Blue",
    :presentation => "Blue",
    :position => 3,
    :option_type => color
  }
]
for opt in opts 
  found = Spree::OptionValue.find_by_presentation(opt[:presentation])
  if found
    found.update_attributes(opt) 
  else
    Spree::OptionValue.create!(opt)
  end
end