class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :owner
      t.string :link
      t.text :desc

      t.timestamps
    end
  end
end
