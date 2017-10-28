ActiveAdmin.register Picture do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :image, :user_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

 index do
    selectable_column
    id_column
    column :image do |picture|
      image_tag picture.image.url(:small)
    end
    column :title do |picture|
      link_to picture.title, admin_picture_path(picture)
    end
    column :user_id do |picture|
    	picture.user.name
    end
    actions
  end

	show do
	  attributes_table do
	    row :user_id do |picture|
	      picture.user.name
	    end
	    row :title
	    row :image do |picture|
	      image_tag picture.image.url(:big)
	    end
	  end
	    # active_admin_comments
	end




end
