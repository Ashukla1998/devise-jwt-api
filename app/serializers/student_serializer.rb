class StudentSerializer
  include JSONAPI::Serializer
  attributes :id, :sname, :rollnumber
end
