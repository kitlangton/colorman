class AddEmailAddressToSupportEmails < ActiveRecord::Migration
  def change
    add_column :support_emails, :email_address, :string
  end
end
