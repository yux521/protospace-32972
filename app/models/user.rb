class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
    # validates :カラム名, バリデーションの種類
  # presence: trueと記述することで、nameカラムが「空ではないか」というバリデーション
  
  has_many :prototypes
  has_many :comments
end
