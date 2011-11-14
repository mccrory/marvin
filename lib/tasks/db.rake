namespace :db do
  
  task :cleanse do
    if posts = Post.all
      posts.each do |post|
        post.destroy
      end
    end
    
    if comments = Comment.all
      comments.each do |page|
        comment.destroy
      end
    end
    
    if pages = Page.all
      pages.each do |page|
        page.destroy
      end
    end
    
    if accounts = Account.all
      accounts.each do |account|
        account.destroy
      end
    end
  end
  
end
