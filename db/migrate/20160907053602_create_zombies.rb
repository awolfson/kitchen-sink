class CreateZombies < ActiveRecord::Migration[5.0]
  def change
    create_table :zombies do |t|

      t.timestamps
    end
  end
end
