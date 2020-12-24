class AddUserRefToIclones < ActiveRecord::Migration[5.2]
  def change
    add_reference :iclones, :user, foreign_key: true
  end
end
