class PhotoCommentsController < ApplicationController
  def index
    @photo_comments = PhotoComment.all

    render("photo_comments/index.html.erb")
  end

  def show
    @photo_comment = PhotoComment.find(params[:id])

    render("photo_comments/show.html.erb")
  end

  def new
    @photo_comment = PhotoComment.new

    render("photo_comments/new.html.erb")
  end

  def create
    @photo_comment = PhotoComment.new


    save_status = @photo_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/photo_comments/new", "/create_photo_comment"
        redirect_to("/photo_comments")
      else
        redirect_back(:fallback_location => "/", :notice => "Photo comment created successfully.")
      end
    else
      render("photo_comments/new.html.erb")
    end
  end

  def edit
    @photo_comment = PhotoComment.find(params[:id])

    render("photo_comments/edit.html.erb")
  end

  def update
    @photo_comment = PhotoComment.find(params[:id])


    save_status = @photo_comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/photo_comments/#{@photo_comment.id}/edit", "/update_photo_comment"
        redirect_to("/photo_comments/#{@photo_comment.id}", :notice => "Photo comment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Photo comment updated successfully.")
      end
    else
      render("photo_comments/edit.html.erb")
    end
  end

  def destroy
    @photo_comment = PhotoComment.find(params[:id])

    @photo_comment.destroy

    if URI(request.referer).path == "/photo_comments/#{@photo_comment.id}"
      redirect_to("/", :notice => "Photo comment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Photo comment deleted.")
    end
  end
end
