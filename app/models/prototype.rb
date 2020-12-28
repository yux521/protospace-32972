class Prototype < ApplicationRecord
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  # validates :カラム名, バリデーションの種類
  # presence: trueと記述することで、nameカラムが「空ではないか」というバリデーション
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  # has_one_attached :ファイル名
  # Prototypeモデルに、has_one_attachedを使用してimageカラムとのアソシエーションを記述
end
