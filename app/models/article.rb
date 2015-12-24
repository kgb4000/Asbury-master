class Article < ActiveRecord::Base

	 validates :title, presence: true,
                    length: { minimum: 5 }

   validates :post, presence: true,
   									length: { minimum: 20 }
end
