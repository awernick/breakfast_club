json.array!(@study_groups) do |study_group|
  json.partial! 'study_groups/study_group', study_group: study_group
  json.url study_group_url(study_group, format: :json)
end
