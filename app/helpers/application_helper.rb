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

  def audio(url)
    url = URI.encode(url)
    "https://audio.vocab.com/1.0/us/#{Nokogiri::HTML(open(url)).xpath('//a/@data-audio').first.value}.mp3"
  rescue StandardError
    # redirect_to 'https://www.vocabulary.com/dictionary/airbag'
  end
end
