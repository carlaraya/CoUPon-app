class AddSlugToOrgs < ActiveRecord::Migration[5.1]
  def change
    add_column :orgs, :slug, :string, unique: true
  end
end
