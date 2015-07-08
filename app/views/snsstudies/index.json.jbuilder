json.array!(@snsstudies) do |snsstudy|
  json.extract! snsstudy, :id, :name, :introduction
  json.url snsstudy_url(snsstudy, format: :json)
end
