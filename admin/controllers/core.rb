Admin.controllers do
  
  # GET /marvin
  get :index do
    render :index
  end
  
  # GET /marvin/import
  get :import do
    render :import
  end
    
    # POST /marvin/import
    post :import do
      # TO-DO
    end
  
  # GET /marvin/support  
  get :support do
    render :support
  end
  
end

Admin.controllers :sessions do
  
  get :new do
    render "sessions/new", :layout => false
  end
  
    post :create do
      if account = Account.authenticate(params[:email], params[:password])
        set_current_account(account)
        redirect url(:index)
      else
        flash[:warning] = "Incorrect email/password combination."
        redirect url(:sessions, :new)
      end
    end
    
  get :destroy do
    set_current_account(nil)
    redirect url(:sessions, :new)
  end
  
end
