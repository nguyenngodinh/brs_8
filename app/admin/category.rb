ActiveAdmin.register Category do
  permit_params :name, :description

  config.sort_order = :name_asc
end
