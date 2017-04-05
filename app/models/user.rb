class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable
  belongs_to :user_type
  has_many :time_off_requests, dependent: :destroy
  has_many :project_approval_requests, dependent: :destroy
  has_many :purchase_order_requests, dependent: :destroy
  has_many :support_requests, dependent: :destroy
  before_validation :set_user_type, on: [:create]

  def set_user_type
    self.user_type_id = UserType.find_by(name: 'general').id
  end

  def name
    "#{self.first_name} #{self.last_name}".titleize
  end

  def timeout_in
    3600.seconds
  end

  def admin?
    self.user_type.name == "executive" || self.user_type.name == "management"
  end

end
