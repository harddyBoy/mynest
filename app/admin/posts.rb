ActiveAdmin.register Post do
	permit_params :title, :body, :category_id
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	index do
		column :id
		column :title, :sortable => :title
		column :category, :sortable => :category
		column :created_at, :sortable => :created_at
		actions
	end


	form do |f|
		f.inputs "Edit" do
			f.input :title, :label => "Title"
			f.input :category, :label => "Category"
			f.input :body, as: :html_editor, :label => "Body"
			f.actions
		end
	end

	show do |post|
	    attributes_table do     
		    row 'body' do
		      raw(post.body)
    		end
  		end
	end

end
