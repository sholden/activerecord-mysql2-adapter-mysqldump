require 'rubygems'
require 'bundler/setup'
require 'activerecord-mysql2-adapter-mysqldump'

module Rails
  def self.env
    'test'
  end
end

class TestAdapter
  include ActiveRecord::ConnectionAdapters::Mysqldump::StructureDump
end