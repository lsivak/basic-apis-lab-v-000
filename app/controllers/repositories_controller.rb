class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
       @resp = Faraday.get 'https://api.github_search.com/application/vnd.github[.version].param[+json]' do |req|
        req.params['client_id'] = 'Iv1.d181c973798d9df9'
        req.params['client_secret'] = '1a4cec10cdb3be577b31ea94acb208f449724322'
        req.params['name'] = 'basic-apis-lab-trial'
        req.params['description'] = 'This is a trial repository. Hopefully it works.'
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


