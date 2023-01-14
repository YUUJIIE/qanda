class Question < ApplicationRecord
    acts_as_taggable_on :tags
    acts_as_taggable_on :categories

    has_many :answers, dependent: :destroy

    validates :title, presence: true
    validates :name, presence: true
    validates :content, presence: true, length: {minimum: 5}
end
