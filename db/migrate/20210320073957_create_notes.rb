class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :text

      t.timestamps
    end
    add_reference :notes, :diary, index: true
  end
end
