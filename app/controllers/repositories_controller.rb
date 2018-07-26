class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
       @resp = Faraday.get 'https://api.github.com/repos/jquery/jquery' do |req|
        req.params['client_id'] = 'Iv1.d181c973798d9df9'
        req.params['client_secret'] = '1a4cec10cdb3be577b31ea94acb208f449724322'
        req.params['name'] = params[:name]
        req.params['query'] = 'Search Github!'
      end
      body = JSON.parse(@resp.body)
 if @resp.success?
   @venues = body["response"]["venues"]
    else
      @error = body["meta"]["errorDetail"]
    end

  rescue Faraday::ConnectionFailed
    @error = "There was a timeout. Please try again."
  end
  render 'search'
    end
  end
