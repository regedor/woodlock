module Woodlock::ApplicationHelper
  def display_flash_messages
    keys = %i[alert error info notice]
    safe_join(keys.map { |key| styled_flash_message_content(key, flash[key]) if flash[key] })
  end

  private

  def styled_flash_message_content(key, msg)
    case key
    when :alert
      flash_message_content(msg, "warning")
    when :error
      flash_message_content(msg, "danger")
    else
      flash_message_content(msg, "info")
    end
  end

  def flash_message_content(msg, alert_type)
    content_tag :div, class: "alert alert-#{alert_type}" do
      message_content = []
      message_content << content_tag(:span, msg, class: "flash-message")
      safe_join(message_content)
    end
  end
end
