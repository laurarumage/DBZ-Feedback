class Feedback < ApplicationRecord
  has_many :reviews
  belongs_to :author, class_name: :User
  belongs_to :recipient, class_name: :User

  validates :author_id, presence: true
  validates :recipient_id, presence: true
  validates :show_up?, presence: true
  validates :check_in?, presence: true
  validates :percent_drive, presence: true
  validates :clarity_of_communication, presence: true
  validates :content, presence: true
  validates_length_of :content, :minimum => 10

  def average_doability
    (reviews.map(&:doable).reduce(:+)/reviews.count) rescue 0
  end

  def average_benevolence
    (reviews.map(&:benevolence).reduce(:+)/reviews.count) rescue 0
  end

  def average_zeroed_inness
    (reviews.map(&:zeroed_in).reduce(:+)/reviews.count) rescue 0
  end
end
