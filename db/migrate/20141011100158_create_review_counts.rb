class CreateReviewCounts < ActiveRecord::Migration
  def change
    create_table :review_counts do |t|
      t.string :rest_id
      t.integer :rev_count

      t.timestamps
    end
  end
end
