#
# Author:: Jomes Turnbull <james@puppetlabs.com>
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
require_relative 'api'

Puppet::Type.type(:revealuptime_probe).provide(:revealuptime_probe) do

  include Reveal::API

  desc 'Manage probes for your Uptime Cloud Monitor account'

  defaultfor :kernel => 'Linux'

  def create
    begin
      create_probe(resource)
    rescue Exception => e
      raise Puppet::Error, "Could not create probe #{resource[:name]}, failed with #{e}"
    end
  end

  def exists?
    probe = get_probe('id', resource)
    if probe
      @probe_id = probe['id']
      true
    else
      false
    end
  end

  def destroy
    begin
      delete_probe(resource)
    rescue Exception => e
      raise Puppet::Error, "Could not delete probe #{resource[:name]}, failed with #{e}"
    end
  end
end
