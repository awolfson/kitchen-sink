class AddArchivedToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :archived, :boolean, null: false, default: false
  end
end
