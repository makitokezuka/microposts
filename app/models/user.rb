class User < ActiveRecord::Base
    before_save { self.email = email.downcase }　#メールアドレスを小文字に変換。before_saveで保存する前にメソッド処理
    validates :name, presence: true, length: {maximum:50} #　名前のバリデーション
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i　#メールアドレスの正規表現パターンの定義
    validates :email, presence: true, length: {maximum:25}, format: {with: VALID_EMAIL_REGEX},uniqueness: {case_sensitive: false }
    has_secure_password
end
