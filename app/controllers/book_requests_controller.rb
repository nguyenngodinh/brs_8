class BookRequestsController < InheritedResources::Base
  
  before_action :user_signed_in?, only: [:index, :create, :destroy]
  
  def create
    @book_request = current_user.book_requests.build book_request_params
    if @book_request.save
      flash[:success] = "Book request created!"
      redirect_to book_requests_path
    else
      @book_requests = current_user.book_requests
      render :index
    end
  end
  
  def index
    if user_signed_in?
      @book_requests = current_user.book_requests
      @book_request = current_user.book_requests.build
    else
      redirect_to root_url
    end
  end

  def destroy
    book_request = BookRequest.find(params[:id]).destroy
    if book_request.destroyed?  
      flash[:success] = "Book request deleted!"
    else
      flash[:danger] = "Could not delete!"
    end
    redirect_to book_requests_path
  end

  private

  def book_request_params
    params.require(:book_request).permit :isbn, :description, :state, :user_id
  end

end
