class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :sites
  has_many :reviews
  validates :role, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
