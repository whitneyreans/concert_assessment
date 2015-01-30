class CreateBandsVenues < ActiveRecord::Migration
  def change
    create_table(:bands_venues) do |t|
      t.belongs_to(:bands)
      t.belongs_to(:venues)
    end
  end
end
