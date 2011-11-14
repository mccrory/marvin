Admin.controllers :entries do
  get :index do
    @entries = Entry.all
    
    render "entries/index"
  end
  
  get :new, :with => :type do
    @type = params[:type]
    @fill = false
    
    if params[:type].blank?
      redirect url(:entries, :new, :type => "text")
    end
    
    render "entries/new"
  end
  
  get :edit, :with => :id do
    @entry = Entry.find(params[:id])
    @type = @entry.type
    @fill = true
    
    render "entries/edit"
  end
    
  post :create do
    type = params[:type].camelize.constantize
    
    entry = type.create(params[:entry])
    entry.created_at = Time.parse(params[:timestamp])
    entry.published = params[:publish] ? 1 : 0 
    
    if entry.save
      if entry.published
        flash[:notice] = "Your entry has been successfully created."
        redirect Marvin.url(:entry, :permalink => entry.permalink)
      else
        flash[:notice] = "Your entry has been successfully saved."
        redirect url(:entries, :index)
      end
    else
      flash[:error] = "Something went wrong! You might not have all of the required fields filled out."
      redirect url(:entries, :new, :type => params[:type])
    end
  end
  
  put :modify do
    entry = Entry.find(params[:id])
    entry.published = params[:publish] ? 1 : 0
    entry.updater = current_account
    
    if entry.update_attributes(params[:entry])
      if entry.published
        flash[:notice] = "Your entry has been successfully modified."
        redirect Marvin.url(:entry, :permalink => entry.permalink)
      else
        flash[:notice] = "Your entry has been successfully modified."
        redirect url(:entries, :index)
      end
    else
      flash[:error] = "Something went wrong!"
      redirect url(:entries, :edit, :id => entry.id)
    end
  end
  
  delete :destroy do
    entry = Entry.find(params[:id])
    
    if entry.destroy
      flash[:notice] = "Your entry has been successfully destroyed."
      redirect url(:entries, :index)
    else
      flash[:error] = "Something went wrong!"
      redirect url(:entries, :edit, :id => entry.id)
    end
  end
end
