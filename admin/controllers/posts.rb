Admin.controllers :posts do
  
  # GET /marvin/posts
  get :index do
    @posts = Post.all
    
    render "posts/index"
  end
  
  # GET /marvin/posts/new
  get :new, :with => :type do
    @type = params[:type]
    @fill = false
    
    if params[:type].blank?
      redirect url(:posts, :new, :type => "text")
    end
    
    render "posts/new"
  end
    
    # GET /marvin/posts/create
    post :create do
      type = params[:type].camelize.constantize
      
      post = type.create(params[:post])
      post.published = params[:publish] ? 1 : 0 
      post.creator = current_account
      
      if post.save
        if post.published
          flash[:notice] = "Your post has been successfully created."
          redirect Marvin.url(:post, :permalink => post.permalink)
        else
          flash[:notice] = "Your post has been successfully saved."
          redirect url(:posts, :index)
        end
      else
        flash[:error] = "Something went wrong! You might not have all of the required fields filled out."
        redirect url(:posts, :new, :type => params[:type])
      end
    end
  
  # GET /marvin/posts/edit/:id
  get :edit, :with => :id do
    @post = Post.find(params[:id])
    @type = @post.type
    @fill = true
    
    render "posts/edit"
  end
    
    # PUT /marvin/posts/modify
    put :modify do
      post = Post.find(params[:id])
      post.published = params[:publish] ? 1 : 0
      post.updater = current_account
      
      if post.update_attributes(params[:post])
        if post.published
          flash[:notice] = "Your post has been successfully modified."
          redirect Marvin.url(:post, :permalink => post.permalink)
        else
          flash[:notice] = "Your post has been successfully modified."
          redirect url(:posts, :index)
        end
      else
        flash[:error] = "Something went wrong!"
        redirect url(:posts, :edit, :id => post.id)
      end
    end
    
    # DELETE /marvin/posts/destroy
    delete :destroy do
      post = Post.find(params[:id])
      
      if post.destroy
        flash[:notice] = "Your post has been successfully destroyed."
        redirect url(:posts, :index)
      else
        flash[:error] = "Something went wrong!"
        redirect url(:posts, :edit, :id => post.id)
      end
    end
  
end
