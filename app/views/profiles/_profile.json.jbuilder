json.extract! profile, :id, :user_id, :username, :name, :dob, :location, :hobbies, :profession, :created_at, :updated_at
json.url profile_url(profile, format: :json)