module Users::TaskListsHelper
  def add_task_link(link_name, form_builder)
    link_to_function 'Add a task' do |page|
      form_builder.fields_for :tasks, Task.new, :child_index => 'NEW_RECORD' do |f|
        html = render(:partial => 'task', :object => f)
        page << "$('tasks').insert({ bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
      end
    end
  end

  def remove_task_link(link_name, form_builder)
    if form_builder.object.new_record?
      link_to_function(link_name, "$(this).up('.task').remove();")
    else
      form_builder.hidden_field(:_delete) + link_to_function(link_name, "$(this).up('.task').hide(); $(this).previous().value = '1'")
    end
  end
end
