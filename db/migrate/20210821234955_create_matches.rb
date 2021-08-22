class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :week
      t.string :home
      t.string :away
      t.string :venue
      t.date :date

      t.timestamps
    end
  end
end
