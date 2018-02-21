class CreateJoinTableStudentsOrgs < ActiveRecord::Migration[5.1]
  def change
    create_join_table :students, :orgs do |t|
      t.index [:student_id, :org_id]
      t.index [:org_id, :student_id]
    end
  end
end
