class Marticle  < ActionView::MissingTemplate

	require 'Earticle'

	attr_accessor :entidades
	def initialize(entidades)
		@Entidad=entidades
	end

	

	def Save_Article()
		puts "Entra en Save"

	  @article=Article.new				
	  @article.title=@Entidad.title	
	  @article.body=@Entidad.body	  	
	  p @Entidad

	  if @Entidad.id.size>0
	  	#update(@article.title,@article.body)

	 else
		  
			  if(@article.save)
			  	@Articles=Article.all
			  	return true

			  else
			  	return false

			  end
		   	
	 end
		
	end
	
	
end