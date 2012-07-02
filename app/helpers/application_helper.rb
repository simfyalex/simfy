module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
    end
  end

  def alphabet_links
    ('A'..'Z').collect { |l| link_to( l, url_for(:letter=>l),:class=>'btn')}.join('').html_safe << link_to( 'all', url_for(),:class=>'btn')
  end

end
