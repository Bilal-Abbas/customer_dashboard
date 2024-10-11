class AddFieldsToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :phone_number, :string
    add_column :customers, :company_name, :string
    add_column :customers, :website, :string
    add_column :customers, :sales_tax_id, :string
    add_column :customers, :address1, :string
    add_column :customers, :suite_unit_apartment, :string
    add_column :customers, :city, :string
    add_column :customers, :zip_code, :string
    add_column :customers, :country, :string
    add_column :customers, :business_type, :string
  end
end
