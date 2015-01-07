class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :sites
  accepts_nested_attributes_for :sites
  has_many :reviews
  accepts_nested_attributes_for :reviews
  has_many :votes, through: :reviews
  accepts_nested_attributes_for :votes

  validates :role, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
