module ApplicationHelper
  def flash_class(key)
    {
      alert: 'is-danger',
      info: 'is-info',
      notice: 'is-success',
      warning: 'is-warning'
    }[key.to_sym]
  end

  def form_field_classes(key, message, classes)
    classes = classes
    classes += ' is-danger' if message.errors[key].present?
    classes
  end
end
