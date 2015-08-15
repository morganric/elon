json.array!(@posts) do |post|
  json.extract! post, :id, :title, :user_id, :body, :summary, :audio, :image, :plays, :url, :published, :hidden
  json.url post_url(post, format: :json)
end
