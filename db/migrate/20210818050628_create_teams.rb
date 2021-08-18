class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :key
      t.string :venue_key
      t.string :name

      t.timestamps
    end
  end
end
