class AddDataToOrgs < ActiveRecord::Migration[5.1]
  def change
    add_column :orgs, :info, :text
    add_column :orgs, :contact, :text
  end
end
