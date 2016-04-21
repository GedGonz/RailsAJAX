class ArticleController < ApplicationController
  require 'Persona'

  def index

  	@Articles=Article.all
  	
  end

  def new
  	@article=Article.new
  end

  def listall
  	render "index"
  end

  def create

	  @article=Article.new
	 
	  @article.title=param[:title]	
	  @article.body=param[:body]  	
	  puts param[:id].size

	  if param[:id].size>0
	  	update(@article.title,@article.body)

	 else
		  respond_to do |format|
			  if(@article.save)
			  	@Articles=Article.all
			  	format.html {redirect_to :controller=>:article, :action=>:index}

			  	#Formato JSON para enviar la vista parcial al archivo articulo.js.erb
		        format.json {render json: {html:render_to_string(:action=>'_list.html.erb', :layout=> false)  } }

			  else
			  	format.html {redirect_to :controller=>:article, :action=>:index}
	  			format.json {render json: { html:render_to_string(:action=>'_list.html.erb', :layout=> false)  } }

			  end
		  end	 	
	 end

  end

  def delete
  	@article=Article.find(params[:id])
  	@article.destroy
  	 respond_to do |format|
		  
		  	@Articles=Article.all
		  	format.html {redirect_to :controller=>:article, :action=>:index}
		  	#Formato JSON para enviar la vista parcial al archivo articulo.js.erb
	        format.json {render json: {html:render_to_string(:action=>'_list.html.erb', :layout=> false)  } }

	  end
  end

  def get_article

  	@article=Article.find(params[:id])
  	respond_to do |format|
  		format.json {render json: @article }
  	end
  end


  def update(title,body)

  	   @article=Article.find(param[:id])
   
       @article.title=title
  	   @article.body=body
   
  	    respond_to do |format|
	   	   if(@article.save)
	   	  	   @Articles=Article.all
	   	  	   format.html {redirect_to :controller=>:article, :action=>:index}
      
	   	  	   #Formato JSON para enviar la vista parcial al archivo articulo.js.erb
	           format.json {render json: {html:render_to_string(:action=>'_list.html.erb', :layout=> false)  } }
	       else
	       	   format.html {redirect_to :controller=>:article, :action=>:index}
      
	   	  	   #Formato JSON para enviar la vista parcial al archivo articulo.js.erb
	           format.json {render json: {html:render_to_string(:action=>'_list.html.erb', :layout=> false)  } }
	       end
   
	    end
  end


  def param
  	params.require(:articles).permit(:id,:title,:body)
  end
end
