class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.string :dni
      t.belongs_to :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
