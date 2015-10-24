json.array!(@professors) do |professor|
  json.partial! 'professors/professor', professor: professor
end
