module ErrorsHelper
  def respond_with_error(status, detail)
    render json: { :errors => { :detail => detail}}, status: status
  end
end
