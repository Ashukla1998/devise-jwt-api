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

      show do
        attributes_table do
          row :id
          row :bname
          row :aname
        end
      end

      form do |f|
        f.inputs do
          f.input :bname
          f.input :aname
        end
        f.actions
      end
end