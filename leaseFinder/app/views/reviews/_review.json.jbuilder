json.extract! review, :id, :email, :propertyID, :review, :stars, :created_at, :updated_at
json.url review_url(review, format: :json)
