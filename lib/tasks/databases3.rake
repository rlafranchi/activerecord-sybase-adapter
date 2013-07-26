require 'active_support/core_ext/object/inclusion'
require 'active_record'

namespace :db do
  namespace :test do

    redefine_task :purge do
      abcs = ActiveRecord::Base.configurations
      case abcs['test']['adapter']
      when /mysql/
        ActiveRecord::Base.establish_connection(:test)
        ActiveRecord::Base.connection.recreate_database(abcs['test']['database'], mysql_creation_options(abcs['test']))
      when /postgresql/
        ActiveRecord::Base.clear_active_connections!
        drop_database(abcs['test'])
        create_database(abcs['test'])
      when /sqlite/
        dbfile = abcs['test']['database']
        File.delete(dbfile) if File.exist?(dbfile)
      when 'sqlserver'
        test = abcs.deep_dup['test']
        test_database = test['database']
        test['database'] = 'master'
        ActiveRecord::Base.establish_connection(test)
        ActiveRecord::Base.connection.recreate_database!(test_database)
      when "oci", "oracle"
        ActiveRecord::Base.establish_connection(:test)
        ActiveRecord::Base.connection.structure_drop.split(";\n\n").each do |ddl|
          ActiveRecord::Base.connection.execute(ddl)
        end
      when 'firebird'
        ActiveRecord::Base.establish_connection(:test)
        ActiveRecord::Base.connection.recreate_database!
      when 'sybase'
        ActiveRecord::Base.establish_connection(:test)
        ActiveRecord::Base.connection.execute("select 'drop table ' + name AS 'DROP' from sysobjects where type = 'U'").each do |t|
          ActiveRecord::Base.connection.execute(t[t.keys.first])
        end

      else
        raise "Task not supported by '#{abcs['test']['adapter']}'"
      end
    end
    task :purge => :load_config if Rake::Task.task_defined?(:load_config)

  end
end