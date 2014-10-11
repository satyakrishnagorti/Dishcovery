json.array!(@review_counts) do |review_count|
  json.extract! review_count, :id, :rest_id, :rev_count
  json.url review_count_url(review_count, format: :json)
end
