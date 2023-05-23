class Question < ApplicationRecord
    acts_as_taggable_on :tags
    acts_as_taggable_on :categories

    has_many :answers, dependent: :destroy

    validates :title, presence: true
    validates :name, presence: true
    validates :content, presence: true, length: {minimum: 5}

    after_create do
        hashtags  = self.content.scan(/[#][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
            # tag = ActsAsTaggableOn::Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
            tag = hashtag.downcase.delete('#')
            tag_list << tag
        end
    end

    before_update do
        tag_list.clear
        hashtags = self.content.scan(/[#][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
            # tag = ActsAsTaggableOn::Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
            tag = hashtag.downcase.delete('#')
            tag_list << tag
        end
    end
end
