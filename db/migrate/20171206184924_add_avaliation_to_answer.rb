class AddAvaliationToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :avaliation, foreign_key: true
  end
end
