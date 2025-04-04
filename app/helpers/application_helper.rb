module ApplicationHelper
  def handle_input_class(model, attribute)
    class_names = [ "input" ]
    if @cron_job.errors[attribute].present?
      class_names << "input-error"
    end

    class_names.split(" ")
  end
end
