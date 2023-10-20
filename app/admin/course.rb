# app/admin/course.rb
ActiveAdmin.register Course do
  permit_params :cname,:code,student_attributes: [:sname,:rollnumber]
  index do
    selectable_column
    id_column
    column :cname
    column :code
    column :created_at
    column "sname", :student do |parent|
      parent.student.sname
    end
    column "Roll number", :student do |parent|
      parent.student.rollnumber
    end
    actions
  end
  
    show do
      attributes_table do
        row :id
        row :cname
        row :code
          panel "student" do
            table_for course.student do
              column :sname
              column :rollnumber
              # ...
            end
          end
        # Display associated student data
        # row :student do |course|
        #     course.student.sname
        #     course.student.rollnumber 
        #   # Display other student attributes here
        # end
      end
    end
  
    # form do |f|
    #   f.inputs 'Course Details' do
    #     # Display course form fields here
  
    #     # Display nested student form fields
    #     f.fields_for :student do |student_fields|
    #       student_fields.input :sname
    #       student_fields.input :rollnumber
    #       # Add other student form fields here
    #     end
    #   end
    #   f.actions
    # end

    # sidebar "User Information", only: [:show, :edit] do
    #   attributes_table_for user do
    #     row :full_name
    #     row :role
    #   end
    # end
  end