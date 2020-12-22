class CreateIclones < ActiveRecord::Migration[5.2]
  def change
    create_table :iclones do |t|
      t.text :content
      t.text :image
      t.timestamps
    end
  end
end
