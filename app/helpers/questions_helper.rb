module QuestionsHelper
    def render_with_hashtags(content)
        content.gsub(/[#][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, questions_path(tag_name: word.delete("#"))}.html_safe
    end
end
