class AddOrganizersToMasterEvents < ActiveRecord::Migration
  def change
    add_reference :master_events, :organizer, index: true, foreign_key: true
  end
end
