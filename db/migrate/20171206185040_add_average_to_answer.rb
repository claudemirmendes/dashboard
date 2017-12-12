class AddAverageToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :average, :integer
  end
end
