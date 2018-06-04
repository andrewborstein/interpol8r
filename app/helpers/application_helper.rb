module ApplicationHelper
  def flash_class(key)
    {
      alert: 'is-danger',
      info: 'is-info',
      notice: 'is-success',
      warning: 'is-warning'
    }[key.to_sym]
  end

  def form_field_classes(attr_key, message, classes, validation_key = nil)
    field_has_errors = message.errors.messages[attr_key].present?

    if field_has_errors
      error_key = message.errors.details[attr_key][0][:error]
      validation_is_applicable = (validation_key == error_key)

      classes += ' is-danger' if (validation_is_applicable || validation_key.nil?)
    end

    classes
  end
end
