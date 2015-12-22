Solidus::FileImport.import_file("products")

size = Spree::OptionType.find_by_presentation!("Size")
color = Spree::OptionType.find_by_presentation!("Color")

ror_baseball_jersey = Spree::Product.find_by_name!("Ruby on Rails Baseball Jersey")
ror_baseball_jersey.option_types = [size, color]
ror_baseball_jersey.save!

