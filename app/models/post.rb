class Post < ActiveRecord::Base
  validates_presence_of :title
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
  validate :click_bait?

  def click_bait?
    errors.add(:title, 'must be clickbait') unless title && (title.match(/Won't\sBelieve|Secret|Top\d|Guess/).class == MatchData)
  end
end
