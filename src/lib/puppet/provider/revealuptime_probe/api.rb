#
# Author:: James Turnbull <james@puppetlabs.com>
#
# Copyright 2012, Puppet Labs
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'uri'
require 'net/https'
require 'base64'

module Reveal
  module API

    API_HOST = 'api.copperegg.com/v2'

    def auth_encode(resource)
      auth = Base64.encode64("#{resource[:apikey]}:U").strip
      auth.gsub("\n",'')
    end

    def generate_headers(resource)
      auth = auth_encode(resource)
      { 'Authorization' => "Basic #{auth}", 'Content-Type' => 'application/json' }
    end

    def build_url(resource, action)
      case action
        when :create
          "https://#{API_HOST}/revealuptime/probes.json"
        when :index
          "https://#{API_HOST}/revealuptime/probes.json"
        when :delete
          "https://#{API_HOST}/revealuptime/probes/#{@probe_id}.json"
      end
    end

    def create_probe(resource)
      begin
        url = build_url(resource, :create)
        headers = generate_headers(resource)
        body = {'probe_desc' => resource[:description], 'probe_dest' => resource[:name],
                'type' => resource[:type], 'frequency' => resource[:frequency]}.to_pson

        Puppet.info("Creating probe #{resource[:name]}")
        response = http_request(:post, url, headers, body)

        body = PSON.parse(response.body)
        @probe_id = body["id"]
      rescue Exception => e
        raise Puppet::Error, "Could not create probe #{resource[:name]}, failed with #{e}"
      end
    end

    def delete_probe(resource)
      begin
        url = build_url(resource, :delete)
        headers = generate_headers(resource)

        Puppet.info("Deleting probe #{resource[:name]}")
        response = http_request(:delete, url, headers)
      rescue Exception => e
        raise Puppet::Error, "Could not delete probe #{resource[:name]}, failed with #{e}"
      end
    end

    def get_probe(data, resource)
      begin
        url = build_url(resource, :index)
        headers = generate_headers(resource)

        response = http_request(:get, url, headers)

        if response
          body = PSON.parse(response.body)
          p = body.detect {|p| p['probe_dest'] == resource[:name] && p['probe_desc'] == resource[:description]}
          return p
        else
          raise Puppet::Error, 'Could not get probe (nil response)!'
        end

      rescue Exception => e
        raise Puppet::Error, "Could not get probe #{data}, failed with #{e}"
        nil
      end
    end

    def http_request(method, url, headers, body=nil)
      Puppet.debug("Url: #{url}")
      Puppet.debug("Headers: #{headers.to_hash.inspect}")
      Puppet.debug("Body: #{body}")

      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      case method
        when :get
          req = Net::HTTP::Get.new(uri.request_uri)
        when :post
          req = Net::HTTP::Post.new(uri.request_uri)
          req.body = body
        when :put
          req = Net::HTTP::Put.new(uri.request_uri)
          req.body = body
        when :delete
          req = Net::HTTP::Delete.new(uri.request_uri)
        else
          raise Puppet::Error, 'Unsupported http method (nil response)!'
          nil
      end

      headers.each{|k,v|
        req[k] = v
      }
      response = http.request(req)

      Puppet.debug("Response Body: #{response.body}")
      Puppet.debug("Status: #{response.code}")

      if bad_response?(method, url, response)
        nil
      else
        response
      end
    end

    def bad_response?(method, url, response)
      case response
        when Net::HTTPSuccess
          false
        else
          true
          raise Puppet::Error, "Got a #{response.code} for #{method} to #{url}"
          true
      end
    end
  end
end
