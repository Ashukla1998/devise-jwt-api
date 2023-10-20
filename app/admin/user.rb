ActiveAdmin.register User do
    index do
        selectable_column
        id_column
        column :email
        column :first_name
        column :last_name
        column :created_at
        actions
      end
end