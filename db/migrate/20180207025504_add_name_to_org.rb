class AddNameToOrg < ActiveRecord::Migration[5.1]
  def change
    add_column :orgs, :name, :string
  end
end
