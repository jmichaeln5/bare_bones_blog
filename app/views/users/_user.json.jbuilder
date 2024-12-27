json.extract! user, :id, :name, :email, :phone_number

json.links do
  json.url user_url(user)
  json.path user_path(user)
  json.json_url user_url(user, format: :json)
  json.json_path user_path(user, format: :json)

end
