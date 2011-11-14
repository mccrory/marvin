Admin.controllers do
  get :index do
    render :index
  end
end

Admin.controllers :sessions do
  get :new do
    render "sessions/new", :layout => false
  end

  get :destroy do
    set_current_account(nil)
    redirect url(:sessions, :new)
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
end
