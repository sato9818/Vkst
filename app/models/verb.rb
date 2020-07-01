class Verb < ApplicationRecord
	self.table_name = "verbs"

    def self.search(method,word)
        if method == "forward_match"
                @posts = Verb.where("verb LIKE?","#{word}%")
        elsif method == "backward_match"
                @posts = Verb.where("verb LIKE?","%#{word}")
        elsif method == "perfect_match"
                @posts = Verb.where("verb LIKE?", "#{word}")
        elsif method == "partial_match"
                @posts = Verb.where("verb LIKE?","%#{word}%")
        else
                @posts = Verb.all
        end
    end
end
