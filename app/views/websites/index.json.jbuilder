json.array!(@websites) do |website|
  json.extract! website, :id, :owner, :link, :desc
  json.url website_url(website, format: :json)
end
