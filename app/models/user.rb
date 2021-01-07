class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases
  # email必須、emailに@が必要
  # password必須、6文字以上
  with_options presence: true do
    validates :nick_name
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :birth_day
  end

  # VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,}\z/
  # validates :password, format: { with: VALID_PASSWORD_REGEX,message: "は6文字以上で半角文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}
  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)\w{6,}\z/
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'must be zenkaku' }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'must be zenkaku' }
  validates :family_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: 'must be zenkaku' }
  validates :first_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: 'must be zenkaku' }
  validates :email, uniqueness: true
end
