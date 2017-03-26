class Life < ApplicationRecord
	 acts_as_taggable_on :tags    
	 belongs_to :user 
	 has_many :joins
	 has_many :group_talks
end
