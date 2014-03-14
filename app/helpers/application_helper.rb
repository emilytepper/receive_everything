module ApplicationHelper
  def link_to_name record, mthd = nil
    return '' unless record
    if mthd
      if record.respond_to?(mthd)
        link_to record.send(mthd), record
      else
        link_to record.id, record
      end
    else
      if record.respond_to?(:name)
        link_to record.name, record
      else
        link_to record.id, record
      end
    end
  end
end
