class SearchesController < ApplicationController
	def top
		@test = Verb.find_by(id: "1")
	end

	def index
	end

	def exlink
	end
	private


end
