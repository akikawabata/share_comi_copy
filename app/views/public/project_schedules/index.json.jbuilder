FullCalendar

json.array!(@projects) do |project|
  json.extract! project, :id, :project_name
  json.start project.start_date_time
  json.end project.end_date_time
  json.url project_url(project, format: :html)
end