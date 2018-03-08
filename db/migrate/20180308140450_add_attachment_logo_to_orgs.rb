class AddAttachmentLogoToOrgs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :orgs do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :orgs, :logo
  end
end
