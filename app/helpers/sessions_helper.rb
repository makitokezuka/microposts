module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
        #!!は右側に続く値が存在する場合はtrueを、nilの場合はfalseを返します。
    end
    
    
    def store_location
        session[:forwarding_url]= request.url if request.get?
        #リクエストがGETの場合は、session[:forwarding_url]にリクエストのURLを代入しておきます
        #ログインが必要なページにアクセスしようとした際に、ページのURLを一旦保存しておき、ログイン画面に遷移。
    end
    
end