class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :render500
  rescue_from ActiveRecord::RecordNotFound, with: :render404

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path # 管理者の場合
    else
      products_path   # 一般ユーザーの場合
    end
  end

  def render500(error = nil)
    Rails.logger.error("❌#{error.message}") if error&.message
    render template: 'errors/error500', layout: 'application', status: :internal_server_error
  end

  def render404(error = nil)
    Rails.logger.error("❌#{error.message}") if error&.message
    render template: 'errors/error404', layout: 'application', status: :not_found
  end
end
