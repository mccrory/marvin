class Admin < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register Padrino::Cache
  register Padrino::Admin::AccessControl
  
  # Sessions
  enable :sessions
  
  # Caching
  enable :caching
  set :cache, Padrino::Cache::Store::Memory.new(50)
  
  # Authentication
  enable :authentication
  disable :store_location
  set :login_page, "/marvin/sessions/new"

  
  access_control.roles_for :any do |role|
    role.protect "/"
    role.allow "/sessions"
    role.allow "/comments/create"
  end 
  
  access_control.roles_for :admin do |role|
    role.project_module :posts, "/posts"
    role.project_module :comments, "/comments"
    role.project_module :pages, "/pages"
    role.project_module :accounts, "/accounts"
  end
  
  # Miscellaneous
  layout :layout
  
end
