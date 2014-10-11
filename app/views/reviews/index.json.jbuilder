json.array!(@reviews) do |review|
  json.extract! review, :id, :rest_id, :user, :review_text, :rating, :sentiment
  json.url review_url(review, format: :json)
end
