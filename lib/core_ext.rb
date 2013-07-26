require 'rake'

if defined?(Rake.application) && Rake.application
  databases_rake = File.expand_path('tasks/databases.rake', File.dirname(__FILE__))
  if Rake.application.lookup("db:create")
    load databases_rake # load the override tasks now
  else # rails tasks not loaded yet; load as an import
    Rake.application.add_import(databases_rake)
  end
else
  warn "Sybase adapter: could not load rake tasks - rake not loaded ..."
end