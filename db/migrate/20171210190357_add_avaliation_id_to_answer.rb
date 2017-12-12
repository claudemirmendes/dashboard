class AddAvaliationIdToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :avaliation_id, :integer
  end
end
