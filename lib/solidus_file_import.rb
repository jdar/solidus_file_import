require 'spree_core'
require 'solidus/file_import'

module SolidusFileImport
  class Engine < Rails::Engine
    engine_name 'solidus_file_import'

    # Needs to be here so we can access it inside the tests
    #TODO: specify by filename
    def self.load_all
      Solidus::FileImport.import_file("payment_methods")
      Solidus::FileImport.import_file("tax_categories")
      Solidus::FileImport.import_file("tax_rates")
      Solidus::FileImport.import_file("shipping_categories")
      Solidus::FileImport.import_file("shipping_methods")

      Solidus::FileImport.import_file("products")
      Solidus::FileImport.import_file("taxons")
      Solidus::FileImport.import_file("option_values")
      Solidus::FileImport.import_file("product_option_types")
      Solidus::FileImport.import_file("product_properties")
      Solidus::FileImport.import_file("prototypes")
      Solidus::FileImport.import_file("variants")
      Solidus::FileImport.import_file("stock")
      Solidus::FileImport.import_file("assets")

      Solidus::FileImport.import_file("orders")
      Solidus::FileImport.import_file("payments")
    end
  end
end
