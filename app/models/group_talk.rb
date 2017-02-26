class GroupTalk < ApplicationRecord
	has_many :users
	has_many :lives
	has_many :mymembers
end
