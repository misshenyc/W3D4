class Enrollment < ApplicationRecord
    belongs_to :course,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Course 

    belongs_to :user,
        primary_key: :id, #<=== id from user table
        foreign_key: :student_id, #<=== foreign id that exists within enrollments
        class_name: :User

end
