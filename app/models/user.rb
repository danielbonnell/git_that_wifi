class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :sites
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
