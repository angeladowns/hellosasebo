class ContactsController < ApplicationController
    invisible_captcha only: [:create, :update], honeypot: :subtitle

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thank you for your message!'
      redirect_back fallback_location: root_path
    else
      flash.now[:error] = 'Oops! Something went wrong. Please try again.'
      format.html { render :new }
    end
  end
end
