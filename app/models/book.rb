class Book < ApplicationRecord
  def self.similar_books(book)
    Book.where author: book.author
   end

    def self.all_genres ; %w[Science\ fiction Drama Action\ and\ Adventure Romance Mystery Horror] ; end #  shortcut: array of strings
    validates :title, :presence => true
    validates :publish_date, :presence => true
    validates :isbn_number, :presence => true, :unless => :grandfathered?
    validates :genre, :presence => true,  :inclusion => {:in => Book.all_genres}

    @@grandfathered_date = Date.parse('1 Jan 1967')

        def grandfathered?
          publish_date && publish_date < @@grandfathered_date
        end
    end
