module Public::PostsHelper
  def render_with_tags(caption)
    caption.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/post/tag/#{word.delete("#")}"}.html_safe
  end 
end
