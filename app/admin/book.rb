ActiveAdmin.register Book do
    permit_params :bname,:aname
    index do
        selectable_column
        id_column
        column :bname
        column :aname
        column :created_at
        actions
      end
end