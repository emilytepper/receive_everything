class Mystic < ActiveRecord::Base
  has_many :accesses
  has_many :meditations, :through => :accesses
  has_many :purchases

  after_create :gain_access_to_free_meditations, :send_email_to_aweber, :deliver_gift_email

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  def has_access_to? meditation
    meditations.include? meditation
  end
  
  def has_access_to_product? product
    purchases.map(&:product).include?(product) or product.meditations.all? { |meditation| has_access_to? meditation }
  end
  
  def password_required?
    super unless facebook_id.present?
  end
  
  def gain_access_to_free_meditations
    Meditation.free.each do |meditation|
      accesses.create :meditation => meditation
    end
  end
  
  def send_email_to_aweber
    begin
      oauth = AWeber::OAuth.new ENV['AWEBER_CONSUMER_KEY'], ENV['AWEBER_CONSUMER_SECRET']
      oauth.authorize_with_access ENV['AWEBER_ACCESS_TOKEN'], ENV['AWEBER_ACCESS_TOKEN_SECRET']
      aweber = AWeber::Base.new oauth
      receive_everything_mailing_list = aweber.account.lists.find_by_name ENV['AWEBER_MAILING_LIST_NAME']
      receive_everything_mailing_list.subscribers.create 'email' => email
    rescue StandardError, AWeber::OAuthError, AWeber::NotFoundError, AWeber::UnknownRequestError, AWeber::RateLimitError, AWeber::ForbiddenRequestError, AWeber::CreationError => error
      Rails.logger.error error.inspect
    end
  end
  
  def deliver_gift_email
    Gift.initiate(self).deliver
  end
end
