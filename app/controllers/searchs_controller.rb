class SearchsController < ApplicationController

  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'item'
      if method == 'perfect'
        User.where(name: content)
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'genre'
      if method == 'perfect'
        Post.where(name: content)
      else
        Post.where('name LIKE ?', '%'+content+'%')
      end
    end
  end

end
