Admin.controllers do
  
  # GET /marvin
  get :index do
    render :index
  end
  
  # GET /marvin/import
  get :import do
    render :import
  end
    
    # POST /marvin/import
    post :import do
      # Only supports Tumblr, for now.
      url = params[:url]
      
      class Tumblr
        include HTTParty
        default_params :output => 'json'
      end
      
      request = Tumblr.get(url + "/api/read?num=100")
      posts = request["tumblr"]["posts"]["post"]
      
      # TO-DO
    end
  
  # GET /marvin/support  
  get :support do
    render :support
  end
  
  ###
  
  # GET /marvin/login
  get :login do
  end
  
  # GET /marvin/logout
  get :logout do
  end
  
end
