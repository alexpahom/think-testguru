module ApplicationHelper

  def github_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow'
  end

  def current_year
    Time.now.year
  end
end
