require_relative '../../config/key.rb'
require 'rest-client' 

class DomainsController < ApplicationController
    def create
        domain_request(params[:domainNames])
    end

    def domain_request(requestBody)

        # require 'net/http'
        # require 'json'
        # begin
        #     uri = URI('https://api.dev.name.com/v4/domains:checkAvailability')
        #     http = Net::HTTP.new(uri.host, uri.port)
        #     req = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json', 'Authorization' => 'Basic a3dva2FzY2gtdGVzdDo1NzJjNTI0NDUyM2MzYWNjMzEyM2ExZDUyMDYwNDE3MDA5YWFiNjg0'})
        #     # req.body = ("#{requestBody}")
        #     req.body = {"domainNames"=>["google.com"]}.to_json
        #     res = http.request(req)
        #     puts "response #{res.body}"
        #     puts JSON.parse(res.body)
        # rescue => exception
        #     puts "failed #{exception}"
        # end

        rest_client = RestClient.post('https://api.dev.name.com/v4/domains:checkAvailability',
            "#{requestBody}",
            :content_type => 'application/json',
            :authorization => "Basic #{NameDotComKey::KEY}" 
        response = JSON.parse(rest_client)
    end

    def domain_request(requestBody)

        rest_client = RestClient.post('https://api.dev.name.com/v4/domains:checkAvailability',
            "#{requestBody}",
            :content_type => 'application/json',
            :authorization => "Basic #{NameDotComKey::KEY}")
        response = JSON.parse(rest_client)
    end
end
