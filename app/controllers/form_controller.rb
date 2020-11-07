class FormController < ApplicationController
  def index
    @contact = Form.new(params[:form])
  end

  def create
    @contact = Form.new(params[:form])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Form object for cleared form
        @contact = Form.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end
end