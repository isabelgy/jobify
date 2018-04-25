class Job < ApplicationRecord
  belongs_to :user
  has_many :saved_jobs
  # has_many :users, :through => :saved_jobs
  validates :title, presence: true
  validates :company, presence: true
  acts_as_taggable_on :tags # Alias for acts_as_taggable_on :tags
  # acts_as_taggable_on :traits
  acts_as_favoritable

  def percentage_match(user)
    percent = 0
    self.tag_list.each do |tag|
      percent += 20 if user.tag_list.include? tag
    end
    if percent == 100
      return "You're the one!"
    elsif percent == 80
      return "Perfect fit!"
    elsif percent == 60
      return "Solid match!"
    elsif percent == 40
      return "A good fit"
    elsif percent == 20
      return "You have a shot"
    else
      return "Skip this one"
    end
  end
end
