class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.datetime :createt_at
      t.string :commented_text
      t.belongs_to :user, index: true, foreign_key: "author_id"
      t.belongs_to :photo, index: true, foreign_key: true
    end
  end
end
