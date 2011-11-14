Admin.controllers :accounts do
  get :index do
    @accounts = Account.all
    
    render "accounts/index"
  end
  
  get :new do
    render "accounts/new"
  end
  
  get :edit, :with => :id do
    @account = Account.find(params[:id])
    
    render "accounts/edit"
  end
  
  post :create do
    account = Account.create(params[:account])
    
    if account.save
      flash[:notice] = "Your account has been successfully created."
      redirect url(:accounts, :index)
    else
      flash[:error] = "Something went wrong!"
      redirect url(:accounts, :create)
    end
  end
  
  put :modify do
    account = Account.find(params[:id])
    
    if account.update_attributes(params[:account])
      flash[:notice] = "Your account has been successfully modified."
      redirect url(:accounts, :index)
    else
      flash[:error] = "Something went wrong!"
      redirect url(:accounts, :edit, :id => account.id)
    end
  end
  
  delete :destroy do
    account = Account.find(params[:id])
    
    if account.destroy
      flash[:notice] = "Your account has been successfully destroyed."
      redirect url(:accounts, :index)
    else
      flash[:error] = "Something went wrong!"
      redirect url(:accounts, :edit, :id => account.id)
    end
  end
end
