class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :rest_id
      t.string :user
      t.string :review_text
      t.string :rating
      t.string :sentiment

      t.timestamps
    end
  end
end
