class BookCommentsController < ApplicationController

	def create
	    book = Book.find(params[:book_id])
	    comment = current_user.book_comments.new(book_comment_params)
	    comment.book_id = book.id
	    comment.save
	    redirect_back fallback_location: book
	end

	def destroy
		user = current_user
	    comment = BookComment.find(params[:book_id])
	    book = comment.book
	    if user == comment.user
	    	comment.destroy
	    end
	    redirect_back fallback_location: book
    end

	private

	def book_comment_params
	    params.require(:book_comment).permit(:user_id,:book_id,:comment)
	end

end
