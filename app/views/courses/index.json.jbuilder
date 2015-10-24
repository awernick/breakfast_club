json.array!(@courses) do |course|
  json.partial! 'courses/course', course: course
  json.url course_url(course, format: :json)
end
