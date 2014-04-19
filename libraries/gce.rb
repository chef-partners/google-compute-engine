# Copyright 2014 Google Inc. All Rights Reserved.
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

require 'open-uri'

module Google
  module Gce

    def gce
      begin
        require 'fog'
      rescue LoadError
        Chef::Log.error("Missing gem 'fog'")
      end

      # TODO(paulrossman): fix
      if node.default['gce']['google_project_id'].empty? or
             node.default['gce']['google_client_email'].empty? or
             node.default['gce']['google_key_location'].empty?
         raise "Missing required Google authentication parameters in attributes/default.rb"
      end

      # TODO(paulrossman): fix
      options = {
        :provider => 'google',
        :google_project => node.default['gce']['google_project_id'],
        :google_client_email => node.default['gce']['google_client_email'],
        :google_key_location => node.default['gce']['google_key_location'],
        :app_name => run_context.cookbook_collection[cookbook_name].metadata.name,
        :app_version => run_context.cookbook_collection[cookbook_name].metadata.version
      }

      @@gce = Fog::Compute.new(options)
    end

  end
end
