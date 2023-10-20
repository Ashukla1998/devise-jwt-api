class CourseSerializer
    include JSONAPI::Serializer
    attributes :id, :cname, :code
  
    attribute :student do |object|
        {
            id:  object.student.id,
            sname: object.student.sname
        }
    end
end
  





 # # attributes :id, :cname, :code,student_attributes: [:sname,:rollnumber]
    # attributes :id, :cname, :code
    # has_one :student,serializer: StudentSerializer

    # # def students
    # #     object.students.map do |student|
    # #     {
    # #         sname: student.sname,
    # #         rollnumber: student.rollnumber
    # #     }
    # #     end
    # # end