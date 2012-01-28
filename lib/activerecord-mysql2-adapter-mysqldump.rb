require 'active_record'
require 'active_record/connection_adapters/mysql2_adapter'

require "activerecord-mysql2-adapter-mysqldump/structure_dump"
require "activerecord-mysql2-adapter-mysqldump/version"

module ActiveRecord
  module ConnectionAdapters
    module Mysqldump
      ActiveRecord::ConnectionAdapters::Mysql2Adapter.send(:include, StructureDump)
    end
  end
end
