class CreateSupportEmails < ActiveRecord::Migration
  def change
    create_table :support_emails do |t|
      t.string :subject
      t.string :body

      t.timestamps null: false
    end
  end
end
