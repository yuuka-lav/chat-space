class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  validates :name, presence: true, uniqueness: true

  def message_show
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        'An image is posted'
      end
    else
      'No Message'
    end
  end
end
