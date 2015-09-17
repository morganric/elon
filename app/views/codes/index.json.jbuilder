json.array!(@codes) do |code|
  json.extract! code, :id, :name, :total, :user_id
  json.url code_url(code, format: :json)
end
