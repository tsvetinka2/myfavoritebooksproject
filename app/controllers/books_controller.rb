class BooksController < ApplicationController
  def index
      if !params.key?(:genres)
        params[:genres] = {}
      end
      permitted = params.permit(:sort, genres: params[:genres].keys)
      sort = permitted[:sort] || session[:sort]

      case sort
        when 'title'
          ordering, @title_header = {:title => :asc}, 'hilite'
        when 'publish_date'
          ordering, @date_header = {:publish_date => :asc}, 'hilite'
      end

      @all_genres = Book.all_genres
      @selected_genres = permitted[:genres] || session[:genres] || {}
      if @selected_genres == {}
        @selected_genres = Hash[@all_genres.map {|genre| [genre, genre]}]
      end

      if permitted[:sort] != session[:sort] or permitted[:genres] != session[:genres]
        session[:sort] = sort
        session[:genres] = @selected_genres
        redirect_to :sort => sort, :genres => @selected_genres and return
      end

      @books = Book.where(genre: @selected_genres.keys).order(ordering)
    end

  # in app/controllers/books_controller.rb

  def show
      id = params[:id] # retrieve book ID from URI route
      @book = Book.find(id) # look up book by unique ID
      # will render app/views/books/show.html.haml by default
  end

  # add to the books_controller.rb
  def new
      @book = Book.new
    # default: render 'new' template
  end

  # in books_controller.rb
  def create
      params.require(:book)
      permitted = params[:book].permit(:title,:genre,:description,:isbn_number,:publish_date,:author)
      permitted[:title] = permitted[:title].split.map(&:capitalize).join(' ')
      @book = Book.new(permitted)
      if @book.save
          flash[:notice] = "#{@book.title} was successfully created."
          redirect_to books_path
      else
          render 'new' # note, 'new' template can access @book's field values!
      end
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      params.require(:book)
      permitted = params[:book].permit(:title,:id,:genre,:description,:isbn_number,:publish_date,:author)
      if @book.update(permitted)
          flash[:notice] = "#{@book.title} was successfully updated."
          redirect_to book_path(@book)
      else
          render 'edit' # note, 'edit' template can access @book's field values!
      end
  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      flash[:notice] = "Book '#{@book.title}' deleted."
      redirect_to books_path
  end

  def search_similar_books
    @given_book = Book.find(params[:id])
    if @given_book.author.nil? || @given_book.author.empty?
      flash[:warning]= "'#{@given_book.title}' has no author info"
      redirect_to books_path
    else
     @books = Book.similar_books(@given_book)
    end
  end
end
