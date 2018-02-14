json.extract! student, :id, :last_name, :first_name, :mi, :year_level, :course, :birthday, :sn, :email, :contact, :created_at, :updated_at
json.url student_url(student, format: :json)
