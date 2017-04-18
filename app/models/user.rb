class User
  include Neo4j::ActiveNode

  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  # Database authenticatable

  property :username, type: String
  validates :username, presence: true
  validates_uniqueness_of :username

  property :email, type: String, default: ''
  validates :email, presence: true

  property :role, type: Integer, default: 0
  enum role: [:user, :admin]

  property :encrypted_password

  # Recoverable
  property :reset_password_token
  property :reset_password_sent_at, type: DateTime

  # Rememberable
  property :remember_created_at, type: DateTime

  # Trackable
  property :sign_in_count, type: Integer, default: 0
  validates :sign_in_count, presence: true
  property :current_sign_in_at, type: DateTime
  property :last_sign_in_at, type: DateTime
  property :current_sign_in_ip, type:  String
  property :last_sign_in_ip, type: String

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
