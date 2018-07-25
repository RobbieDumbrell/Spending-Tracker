class Formatter

  def self.pound_format(number)
    if number < 0
      string_number = number.to_s
      string_number[0] = ''
      string_number.to_i
      return "£(#{string_number})"
    elsif number > 0
      return "£#{number}"
    else
      return "£0"
    end
  end

end
