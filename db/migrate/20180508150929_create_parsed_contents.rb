class CreateParsedContents < ActiveRecord::Migration[5.1]
  def change
    create_table :parsed_contents do |t|
      t.string :email, null: false
      t.string :url, null: false
      t.jsonb :data, null: false, default: {}

      t.timestamps
    end

    add_index :parsed_contents, :data, using: :gin
  end
end
