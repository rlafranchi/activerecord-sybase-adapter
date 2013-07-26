require 'rake'

Rake::DSL.module_eval do

  def redefine_task(*args, &block)
    if Hash === args.first
      task_name = args.first.keys[0]
      old_prereqs = false # leave as specified
    else
      task_name = args.first; old_prereqs = []
      # args[0] = { task_name => old_prereqs }
    end

    full_name = Rake::Task.scope_name(Rake.application.current_scope, task_name)

    if old_task = Rake.application.lookup(task_name)
      old_comment = old_task.full_comment
      old_prereqs = old_task.prerequisites.dup if old_prereqs
      old_actions = old_task.actions.dup
      old_actions.shift # remove the main 'action' block - we're redefining it
      # old_task.clear_prerequisites if old_prereqs
      # old_task.clear_actions
      # remove the (old) task instance from the application :
      Rake.application.send(:instance_variable_get, :@tasks)[full_name.to_s] = nil
    else
      # raise "could not find rake task with (full) name '#{full_name}'"
    end

    new_task = task(*args, &block)
    new_task.comment = old_comment # if old_comment
    new_task.actions.concat(old_actions) if old_actions
    new_task.prerequisites.concat(old_prereqs) if old_prereqs
    new_task
  end

end

load File.expand_path('databases3.rake', File.dirname(__FILE__))

#if defined? ActiveRecord::Tasks::DatabaseTasks # 4.0
#  load File.expand_path('databases4.rake', File.dirname(__FILE__))
#else # 3.x / 2.3
#  load File.expand_path('databases3.rake', File.dirname(__FILE__))
#end