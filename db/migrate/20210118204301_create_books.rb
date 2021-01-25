class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string 'title'
      t.string 'genre'
      t.text 'description'
      t.string 'isbn_number'
      t.datetime 'publish_date'
      # Add fields that let Rails automatically keep track
      # of when books are added or modified:
      t.timestamps
    end
  end
end
