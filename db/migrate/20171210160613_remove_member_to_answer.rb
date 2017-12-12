class RemoveMemberToAnswer < ActiveRecord::Migration[5.0]
  def change
    remove_reference :answers, :member, foreign_key: true
  end
end
