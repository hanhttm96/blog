ActiveAdmin.register Article do
menu parent: "News"

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
permit_params :title, :image, :descriptions, :body, :type_id

form do |f|
	f.inputs "Article" do
	  f.input :title
      f.input :descriptions
      f.input :image, :as => :file
      # Will preview the image when the object is edited
      f.input :body
      f.input :type_id, :as => :select, :collection => Type.all.collect {|type| [type.name, type.id] }

  end
  f.actions
end
show do |ad|
		attributes_table do
        row :id
      	row :title
      	row :descriptions
      	row :image do
          image_tag(ad.image.url(:medium))
        end
        row :body
        row :type_id

    end
    attributes_table do 
      row :article_comments
      #admin should be see any comments.
    end 
end
index do
  selectable_column
  column :title
  column :image do |inx| image_tag(inx.image.url(:thumb)) end
  column :created_at
  column :updated_at
  column :type_id
  actions
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
