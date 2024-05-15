class DocumentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @document = current_user.documents.build(document_params)
    if @document.save
      render json: @document, status: :created
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end
  
  private
  
  def document_params
    params.require(:document).permit(:document_type, :file)
  end
end
  