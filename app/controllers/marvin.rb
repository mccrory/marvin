Marvin.controllers do
  
  before do
    @pages = Page.all
  end
  
  # GET /
  # Display the post index.
  get :index do
    paginate!(Post, 10)
  
    @posts = @paginator.page(1)
    
    render :index
  end
  
  # GET /page/:number
  # Display paginated stuff.
  get :paginate, :map => '/page/:number' do
    paginate!(Post, 10)
    
    @posts = @paginator.page(params[:number])
    
    render :index
  end
  
  # GET /feed.atom
  # A RSS feed.
  get :feed, :provides => :xml do
    @posts = Post.sort(:updated_at.desc)
    
    builder :'feed'
  end
  
  # GET /:year/:month/:day/:permalink
  # Display a single post.
  get :post, :map => "/post/:permalink" do
    @post = Post.find_by_permalink(params[:permalink])
    #@comments = @post.comments.sort(:updated_at.desc)
    
    render :post
  end
  
  # GET /:permalink
  # Display a page.
  get :page, :map => "/:permalink" do
    @page = Page.find_by_permalink(params[:permalink])
    
    render :page
  end
  
end
