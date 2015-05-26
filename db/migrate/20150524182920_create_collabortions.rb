class CreateCollabortions < ActiveRecord::Migration
  def change
    create_table :collabortions do |t|
      t.integer :wiki_id
      t.integer :collaborator_id

      t.timestamps
    end
  end
end
