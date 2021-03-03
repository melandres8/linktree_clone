json.extract! profile_social, :id, :name, :username, :created_at, :updated_at
json.url profile_social_url(profile_social, format: :json)
