require 'active_record'
require 'active_record/connection_adapters/mysql2_adapter'

require "activerecord-mysql2-adapter-mysqldump/structure_dump"
require "activerecord-mysql2-adapter-mysqldump/version"

module ActiveRecord
  module ConnectionAdapters
    module Mysqldump
      class ActiveRecord::ConnectionAdapters::Mysql2Adapter
        include StructureDump
        alias :default_structure_dump :structure_dump
        alias :structure_dump :mysqldump_structure_dump
      end
    end
  end
end
