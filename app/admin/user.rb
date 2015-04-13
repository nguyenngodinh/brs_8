ActiveAdmin.register User, {sort_order: :id} do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  permit_params :name, :email, :avatar, :role
  menu priority: 1

  scope :all, default: true
  scope :admin
  scope :member

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :role
    actions
  end
end
