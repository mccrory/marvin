Admin.controllers :comments do
  
  # GET /marvin/comments
  get :index do
    @comments = Comment.all
    
    render "comments/index"
  end
    
    # POST /marvin/comments/invert
    post :invert do
      comment = Comment.find(params[:id])
      
      comment.approved = !comment.approved
      
      if comment.save
        flash[:notice] = "Comment status inverted."
        redirect url(:comments, :index)
      else
        flash[:error] = "Something went wrong."
        redirect url(:comments, :index)
      end
    end
    
    # DELETE /marvin/comments/destry
    delete :destroy do
      comment = Comment.find(params[:id])
      
      if comment.destroy
        flash[:notice] = "Comment successfully destroyed."
        redirect url(:comments, :index)
      else
        flash[:error] = "Something went wrong!"
        redirect url(:comments, :index)
      end
    end
  
  # POST /marvin/comment/create
  post :create do
    post = Post.find(params[:id])
    
    comment = Comment.create(params[:comment])
    
    post.comments << comment
    
    if comment.save
      flash[:notice] = "Your comment has been created and awaiting moderation."
    else
      flash[:error] = "Something went wrong!"
    end
    
    redirect Marvin.url(:post, :permalink => post.permalink)
  end
  
end
