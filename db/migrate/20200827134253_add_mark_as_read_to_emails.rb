class AddMarkAsReadToEmails < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :marks_as_read, :boolean
  end
end
