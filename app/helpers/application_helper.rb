module ApplicationHelper

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow'
  end

  def current_year
    Time.now.year
  end

  def flash_class(type)
    case type
      when :notice then 'alert alert-info'
      when :success then 'alert alert-success'
      when :error then 'alert alert-error'
      when :alert then 'alert alert-error'
    end
  end
end
