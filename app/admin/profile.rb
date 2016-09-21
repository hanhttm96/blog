ActiveAdmin.register Profile do
menu parent: "Users management"
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
permit_params :name, :avatar, :birthday, :sex, :address, :user_id


form do |f|
	f.inputs "Profile" do
	  f.input :name
      f.input :avatar, :as => :file
      # Will preview the image when the object is edited
      f.input :birthday
      f.input :sex, :as => :radio, :collection => ["male", "female"]
      f.input :address
      f.input :user_id
  end
  f.actions
end
show do |ad|
		attributes_table do
      	row :name
      	row :avatar do
          image_tag(ad.avatar.url(:medium))
        end
        row :birthday
        row :sex
        row :address
        row :user_id

    end
end
controller do
    # This code is evaluated within the controller class
    before_action :checkuser
    def checkuser
      if (current_user.email == "myhanhqt96@gmail.com")
      else
        redirect_to root_path, :notice => "You aren't Admin!"
      end
    end
  end
end


