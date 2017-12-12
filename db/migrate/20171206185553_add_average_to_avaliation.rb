class AddAverageToAvaliation < ActiveRecord::Migration[5.0]
  def change
    add_column :avaliations, :average, :integer
  end
end
