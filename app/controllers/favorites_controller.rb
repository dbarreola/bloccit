class FavoritesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: @post)
		authorize favorite

		if favorite.save
			flash[:notice] = "Added to favorites."
	     	redirect_to [@post.topic, @post]
	    else
	    	flash[:error] = "Something went wrong... Please try again."
	    	redirect_to @post
	    end
	end

	def destroy
		@post = Post.find(params[:post_id])
		favorite = current_user.favorite.find(:post_id)
		authorize favorite
		
		if favorite.destroy
			flash[:notice] = "Success."
			redirect_to @post
		else
			flash[:error] = "Something went wrong... Please try again."
			redirect_to @post
		end
	end


end
