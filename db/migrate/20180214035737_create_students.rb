class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :last_name
      t.string :first_name
      t.string :mi
      t.integer :year_level
      t.string :course
      t.date :birthday
      t.string :sn
      t.string :email
      t.string :contact

      t.timestamps
    end
  end
end
