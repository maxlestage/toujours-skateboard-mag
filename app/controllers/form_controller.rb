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
        format.js   { flash.now[:success] = @message = "Merci pour votre message, nous allons revenir vers vous au plus vite! " }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Désolé, le message n'a pu être envoyé." }
      end
    end
  end
end