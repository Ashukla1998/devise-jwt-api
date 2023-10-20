class Course < ApplicationRecord
    has_one :student 
    accepts_nested_attributes_for :student
end
