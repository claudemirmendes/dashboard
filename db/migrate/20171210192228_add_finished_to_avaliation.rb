class AddFinishedToAvaliation < ActiveRecord::Migration[5.0]
  def change
    add_column :avaliations, :finished, :boolean
  end
end
