class ContactForm
  include ActiveModel::Model

  attr_accessor :subject, :name, :content

  validates :subject, presence: true
  validates :name, presence: true
  validates :content, presence: true
end
