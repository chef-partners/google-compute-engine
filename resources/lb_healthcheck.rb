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

actions :create, :delete

# set 'wait_for true' to block on request                                       
attribute :wait_for,              :kind_of => [TrueClass, FalseClass], :default => false

attribute :name,                  :kind_of => String
attribute :description,           :kind_of => String
attribute :host,                  :kind_of => String
attribute :request_path,          :kind_of => String, :default => "/"
attribute :port,                  :kind_of => Integer, :default => 80
attribute :check_interval_sec,    :kind_of => Integer, :default => 5
attribute :timeout_sec,           :kind_of => Integer, :default => 5
attribute :unhealthy_threshold,   :kind_of => Integer, :default => 2
attribute :healthy_threshold,     :kind_of => Integer, :default => 2

def initialize(*args)
  super
  @action = :create
end
