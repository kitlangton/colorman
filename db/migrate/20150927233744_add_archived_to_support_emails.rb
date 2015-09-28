class AddArchivedToSupportEmails < ActiveRecord::Migration
  def change
    add_column :support_emails, :archived, :boolean, default: false
  end
end
