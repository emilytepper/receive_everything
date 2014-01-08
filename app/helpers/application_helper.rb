module ApplicationHelper
  def link_to_name record
    return '' unless record
    if record.respond_to?(:name)
      link_to record.name, record
    else
      link_to record.id, record
    end
  end
end
