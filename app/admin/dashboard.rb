ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  

  content title: proc{ I18n.t("active_admin.dashboard") } do
    

    # Here is an example of a simple dashboard with columns and panels.
    #

     columns do


        #Newest contacts
       column do
         panel "News Contacts" do
          ul do
            Contact.order("created_at DESC").limit(3).map do |contact|
              li (link_to contact.title, admin_contact_path(contact.id)) + " - from: " + contact.user.email
            end
          end
         end
       end
       
        #newest article posted
       column do
         panel "News Articles" do
          ul do
            Article.order("created_at DESC").limit(5).map do |ar|
              li (link_to ar.title, admin_article_path(ar.id)) + " - type: " + ar.type.name
            end
          end
        end
       end

      # Newest User register
     column do
         panel "News Users" do
          ul do
            User.order("created_at DESC").limit(5).map do |user|
              li (link_to user.email, admin_user_path(user.id)) + " - Time: " + user.created_at
            end
          end
        end
       end
       

   end 
   columns do
       column do
         panel "News Types" do
          ul do
            Type.order("created_at DESC").  limit(5).map do |ty|
              li (link_to ty.name, admin_type_path(ty.id))
            end
          end
        end
       end
   end 
   
  end # content


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
