class AssociatePlaysWithChartsNotSongs < ActiveRecord::Migration
  def change
    remove_column :plays, :song_id, :integer
    remove_column :plays, :difficulty, :string
    add_column :plays, :chart_id, :integer
  end
end
