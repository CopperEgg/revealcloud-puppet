#
# Custom Funtion:  create_env_array()
#
# input:  hash of copperegg::params as follows:
#   create_env_array( { "RC_UUID=" => $copperegg::params::revealCloudUUID,
#                                      "RC_TAG="  => $copperegg::params::revealCloudTags,
#                                      "RC_OOM_PROTECT=" => $copperegg::params::revealCloudOomProtect,
#                                      "RC_LABEL=" => $copperegg::params::revealCloudLabel,
#                                      "RC_PROXY=" => $copperegg::params::revealCloudProxy } ),
#   if called as above, (see install.pp), arg will be an array containing the hash specified
#
# output: array of env strings, with null strings removed
#
# Copyright 2013 CopperEgg Corporation
#
#encoding: utf-8

module Puppet::Parser::Functions
  newfunction(:create_env_array, :type => :rvalue) do |arg|
    arr = Array.new
    hsh = Hash.new
    hsh = arg[0]
    hsh.each do |key,value|
      if (value.to_s != nil) && (value.to_s != '') && (value.to_s != 'undef')
        str = key.to_s + value.to_s
        arr.concat([str])
      end
    end
    arr
  end
end

