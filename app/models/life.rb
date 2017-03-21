class Life < ApplicationRecord
	 acts_as_taggable_on :tags    
	 has_many :users  
	 has_many :joins
	 has_many :group_talks
end
