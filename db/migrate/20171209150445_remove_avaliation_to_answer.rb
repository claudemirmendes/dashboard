class RemoveAvaliationToAnswer < ActiveRecord::Migration[5.0]
  def change
    remove_reference :answers, :avaliation, foreign_key: true
  end
end
