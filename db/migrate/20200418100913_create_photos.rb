class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.datetime :createt_at
      t.integer :likes_count
      t.belongs_to :user, index: true, foreign_key: "author_id"
      t.belongs_to :location, index: true, foreign_key: true
    end
  end
end
