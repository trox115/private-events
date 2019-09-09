class AddInvitedAndAttending < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :attending, :boolean, default: false
  end
end
