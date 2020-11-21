class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        top2_path # ログイン後に遷移するpathを設定
      end
    
      def after_sign_out_path_for(resource)
        top_path # ログアウト後に遷移するpathを設定
      end

      before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile, :image])
    end
end
