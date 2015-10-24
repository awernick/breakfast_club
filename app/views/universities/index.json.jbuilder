json.array!(@universities) do |university|
  json.partial! 'universities/university', university: university
  json.url university_url(university, format: :json)
end
