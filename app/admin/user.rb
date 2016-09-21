ActiveAdmin.register User do
	menu parent: "Users management"
  	permit_params :email, :password
end