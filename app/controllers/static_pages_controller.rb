class StaticPagesController < ApplicationController
  def index
    @articles = Article.all
  end

  def about
  end

  def contact
    
  end
  
  def services
    
  end
end
