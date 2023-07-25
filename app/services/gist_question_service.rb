# frozen_string_literal: true

class GistQuestionService

  def initialize(question, client = default_client)
    @question = question
    @client = client
    @test_title = question.test.title
  end

  def call
    @client.create_gist(params).yield_self { |response| retrieve_url response }
  rescue Octokit::Unauthorized => _e
    OpenStruct.new(success?: false)
  end

  private

  def retrieve_url(response)
    OpenStruct.new(
      success?: @client.last_response.status == 201,
      url: response[:html_url]
    )
  end

  def question_content
    ([@question.body] + @question.answers.pluck(:body)).join("\n")
  end

  def params
    {
      description: @test_title,
      files: {
        'testguru-question.txt': {
          content: question_content
        }
      }
    }
  end

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN'))
  end
end
