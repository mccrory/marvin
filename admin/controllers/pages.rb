Admin.controllers :pages do
  
  # GET /marvin/pages
  get :index do
    @pages = Page.all
    
    render "pages/index"
  end
  
  # GET /marvin/new
  get :new do
    render "pages/new"
  end
    
    # POST /marvin/create
    post :create do
      page = Page.new(params[:page])
      
      if page.save
        flash[:notice] = "Your page has been saved successfully."
        redirect url(:pages, :index)
      else
        flash[:error] = "Something went wrong!"
        redirect url(:pages, :new)
      end
    end
    
  # GET /marvin/edit
  get :edit, :with => :id do
    @page = Page.find(params[:id])
    
    render "pages/edit"
  end
    
    # PUT /marvin/modify
    put :modify do
      page = Page.find(params[:id])
    
      if page.update_attributes(params[:page])
        flash[:notice] = "Your page has been saved successfully."
        redirect url(:pages, :index)
      else
        flash[:error] = "Something went wrong!"
        redirect url(:pages, :edit, :id => page.id)
      end
    end
    
    # DELETE /marvin/destroy
    delete :destroy do
      page = Page.find(params[:id])
      
      if page.destroy
        flash[:notice] = "Your page has been successfully."
        redirect url(:pages, :index)
      else
        flash[:error] = "Something went wrong!"
        redirect url(:pages, :edit, :id => page.id)
      end
    end
  
end
