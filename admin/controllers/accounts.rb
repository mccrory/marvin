Admin.controllers :accounts do

  # GET /marvin/accounts
  get :index do
    @accounts = Account.all
    
    render "accounts/index"
  end
  
  # GET /marvin/accounts/new
  get :new do
    render "accounts/new"
  end
    
    # POST /marvin/accounts/create
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
  
  # GET /marvin/accounts/edit/:id
  get :edit, :with => :id do
    @account = Account.find(params[:id])
    
    render "accounts/edit"
  end
    
    # PUT /marvin/accounts/modify
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
    
    # DELETE /marvin/accounts/destroy
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
