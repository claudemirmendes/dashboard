class CreateAvaliations < ActiveRecord::Migration[5.0]
  def change
    create_table :avaliations do |t|
      t.references :user, foreign_key: true
      t.string :description
      t.date :validade

      t.timestamps
    end
  end
end
