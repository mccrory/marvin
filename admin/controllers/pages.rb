Admin.controllers :pages do
  get :index do
    @pages = Page.all
    
    render "pages/index"
  end
  
  get :new do
    render "pages/new"
  end
  
  get :edit, :with => :id do
    @page = Page.find(params[:id])
    
    render "pages/edit"
  end
    
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
