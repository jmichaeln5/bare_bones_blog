json.extract! user, :id, :name, :email, :phone_number
json.url user_url(user, format: :json)
