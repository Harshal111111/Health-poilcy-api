class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.references :documentable, polymorphic: true, null: false
      t.string :document_type

      t.timestamps
    end
  end
end
