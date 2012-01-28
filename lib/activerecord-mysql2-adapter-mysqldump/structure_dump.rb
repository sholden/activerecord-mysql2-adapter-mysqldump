module ActiveRecord
  module ConnectionAdapters
    module Mysqldump
      module StructureDump
        def mysqldump_structure_dump
          abcs = ActiveRecord::Base.configurations
          ENV['MYSQL_HOST'] = abcs[Rails.env]['host'] if abcs[Rails.env]['host']
          ENV['MYSQL_TCP_PORT'] = abcs[Rails.env]['port'].to_s if abcs[Rails.env]['port']
          ENV['MYSQL_PWD']  = abcs[Rails.env]['password'] if abcs[Rails.env]['password']
          command = "mysqldump -u#{abcs[Rails.env]['username']} #{abcs[Rails.env]['database']} --no-data --skip-comments"
          dump = `#{command}`
          raise 'Error dumping database' if $?.exitstatus == 1
          dump
        end
      end
    end
  end
end
