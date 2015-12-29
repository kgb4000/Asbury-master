class CreateTithes < ActiveRecord::Migration
  def change
    create_table :tithes do |t|

      t.timestamps null: false
    end
  end
end
