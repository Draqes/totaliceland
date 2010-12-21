module ApplicationHelper

  # Return title on a per-page basis
  def title
    base_title = "Total Iceland"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

end
