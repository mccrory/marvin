Admin.controllers :users do
  
  # GET /marvin/users
  get :index do
    @users = User.all
    
    render "users/index"
  end
  
  # GET /marvin/users/new
  get :new do
    render "users/new"
  end
    
    # POST /marvin/users/create
    post :create do
      user = User.create(params[:user])
      
      if user.save
        flash[:notice] = "Your user has been successfully created."
        redirect url(:users, :index)
      else
        flash[:error] = "Something went wrong!"
        redirect url(:users, :create)
      end
    end
  
  # GET /marvin/users/edit/:id
  get :edit, :with => :id do
    @user = User.find(params[:id])
    
    render "users/edit"
  end
    
    # PUT /marvin/users/modify
    put :modify do
      user = User.find(params[:id])
      
      if user.update_attributes(params[:user])
        flash[:notice] = "Your user has been successfully modified."
        redirect url(:users, :index)
      else
        flash[:error] = "Something went wrong!"
        redirect url(:users, :edit, :id => user.id)
      end
    end
    
    # DELETE /marvin/users/destroy
    delete :destroy do
      user = User.find(params[:id])
      
      if user.destroy
        flash[:notice] = "Your user has been successfully destroyed."
        redirect url(:users, :index)
      else
        flash[:error] = "Something went wrong!"
        redirect url(:users, :edit, :id => user.id)
      end
    end
  
end
