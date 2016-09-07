class AddNameAndWeaponToZombies < ActiveRecord::Migration[5.0]
  def change
    add_column :zombies, :name, :string
    add_column :zombies, :weapon, :string
  end
end
