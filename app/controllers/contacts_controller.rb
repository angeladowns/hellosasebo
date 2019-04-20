class ContactsController < ApplicationController
  invisible_captcha only: [:contact]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thank you for your message!'
      redirect_to :back
    else
      flash.now[:error] = 'Oops! Something went wrong. Please try again.'
      render :new
    end
  end
end
