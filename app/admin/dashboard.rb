ActiveAdmin.register_page "Dashboard" do

    content do
        panel "Recent Posts" do
            table_for Post.order("id desc").limit(15) do
                column :id
                column "Post Title", :title do |post|
                    link_to post.title, [:admin, post]
                end
                column :category, :sortable => :category
                column :created_at
            end
            strong(link_to "Show All Posts", :admin_posts)
        end




        panel "Categories" do
            table_for Category.order("id desc").limit(15) do
                column :id
                column "Category Title", :name do |category|
                    link_to category.name, [:admin, category]
                end

                column :created_at
            end
            strong(link_to "Show All Categories", :admin_categories)
        end
    end


  # menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  # content title: proc{ I18n.t("active_admin.dashboard") } do
  #   div class: "blank_slate_container", id: "dashboard_default_message" do
  #     span class: "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #     end
  #   end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  # end # content
end
