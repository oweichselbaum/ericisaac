module ApplicationHelper
  def body_classes
    unless response.status == 200
      "exception_#{response.status}"
    else
      [controller.controller_name,
       controller.action_name].compact.join(" ")
    end
  end
  def photo_tags(photo)
    tags = photo.tags.map {|x| x.name.tr(' ', '_')}.join(' ')
    tags.to_s.downcase
  end
end
