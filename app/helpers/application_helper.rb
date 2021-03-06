require 'open-uri'
require 'uri'

module ApplicationHelper
  def paginate objects, options = {}
    options.reverse_merge!(theme: 'twitter-bootstrap-4')
    super(objects, options)
  end

  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def image(word)
    url = URI.encode("https://www.bing.com/images/search?q=#{word}")
    doc = Nokogiri::HTML(open(url))
    doc.css('div#b_content img').map { |img| img.attr('src') }.second
  end
end
