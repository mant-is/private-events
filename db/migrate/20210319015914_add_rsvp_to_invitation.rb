class AddRsvpToInvitation < ActiveRecord::Migration[6.1]
  def change
    add_column :invitations, :rsvp, :integer
  end
end
