ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
  #    span class: "blank_slate" do
  #      span I18n.t("active_admin.dashboard_welcome.welcome")
  #      small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #    end
    end
    # Here is an example of a simple dashboard with columns and panels.
    #
     columns do
       column do
         panel "Recent Adventures" do
           ul do
             Adventure.last(24).map do |adventure|
               li link_to(adventure.name, admin_adventure_path(adventure))
             end
           end
         end
       end

         column do
           panel "Contributors" do
             ul do
               User.all.map do |user|
                 li link_to(user.username, admin_user_path(user))
               end
             end
           end
         end

      # column do
      #   panel "Info" do
      #     para "Welcome to ActiveAdmin."
      #   end
      # end
     end
  end # content
end
