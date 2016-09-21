module ApplicationHelper
	#menu
	  def nav_links
	    items = [home_link, share_link, contact_link, user_link]
	    content_tag :ul, :class => "nav menu-top" do
	      items.collect { |item| concat item}
	    end
	  end

	  def home_link
	     link_to "Home", root_path
	  end
	  
	  def share_link 
	      link_to "Sharing",{:controller => "shares", :action => "index"}
	  end

	  def contact_link 
	      link_to "Contact",{:controller => "contacts", :action => "new"}
	  end
	  def user_link
		if logged_in?
			
			(link_to "Manage account", edit_user_path(current_user.id)) +

			(link_to "Logout", logout_path)
		else
			(link_to "Login", login_path) + 

			(link_to "register", {:action=>"new", :controller=>"users"})
		end 
	end


end
