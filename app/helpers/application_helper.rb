module ApplicationHelper
  def paginate objects, options = {}
    options.reverse_merge!(theme: 'twitter-bootstrap-4')
    super(objects, options)
  end
end
