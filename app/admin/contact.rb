ActiveAdmin.register Contact do
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
permit_params :title, :content, :user_id

form do |f|
	f.inputs "Contact" do
		para(" You don't have a mission to create new or edit contacts")
		para(link_to 'come back', {:controller => "contacts", :action => "index"})
	end
end
show do |ad|
	attributes_table do
        row :title
        row :content
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
