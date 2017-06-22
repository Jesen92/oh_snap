module ErrorsHelper
  def respond_with_error(status, detail)
    render json: { :erros => { :detail => detail}}, status: status
  end
end
