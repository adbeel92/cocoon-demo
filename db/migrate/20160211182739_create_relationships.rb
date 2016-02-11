class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :person, index: true, foreign_key: true
      t.belongs_to :collaborator, index: true, foreign_key: true
      t.integer :rel_type

      t.timestamps null: false
    end
  end
end
