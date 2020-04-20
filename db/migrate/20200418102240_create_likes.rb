class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true,  foreign_key: "author_id"
      t.belongs_to :photo, index: true, foreign_key: true
    end
  end
end
