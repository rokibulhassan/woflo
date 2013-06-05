class AddFieldsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :code, :string
    add_column :projects, :created_by, :integer
    add_column :projects, :company_id, :integer
  end
end
