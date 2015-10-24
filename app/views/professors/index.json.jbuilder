json.array!(@professors) do |professor|
  json.partial! 'professors/professor', professor: professor
  json.url professor_url(professor, format: :json)
end
