require 'spec_helper'

describe ActiveRecord::ConnectionAdapters::Mysqldump::StructureDump do
  before :each do
    @adapter = TestAdapter.new
  end

  it "shells out to mysqldump to get the database structure" do
    ActiveRecord::Base.configurations[Rails.env] = {
        'username' => 'username',
        'password' => 'password',
        'database' => 'database',
        'host'     => 'localhost',
        'port'     => 3306
    }

    command = "mysqldump -uusername database --no-data --skip-comments"
    IO.should_receive(:popen).with(command).and_return('success')

    @adapter.mysqldump_structure_dump.should == 'success'
  end

  it "should include StructureDump into ActiveRecord::ConnectionAdapters::Mysql2Adapter" do
    sd = ActiveRecord::ConnectionAdapters::Mysqldump::StructureDump
    ActiveRecord::ConnectionAdapters::Mysql2Adapter.included_modules.should include(sd)
  end
end