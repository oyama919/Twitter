class Blog < ActiveRecord::Base
    validates :content, presence: true, length: { maximum: 256 } 
end
