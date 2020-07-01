class PostsController < ApplicationController
	def search
		method = params[:search_method]
	    word = params[:search_word]
	    @posts = Verb.search(method, word)
	end

end
