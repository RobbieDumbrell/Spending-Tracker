class Formatter

  def self.pound_format(number)
    if number < 0
      string_number = number.to_s
      string_number[0] = ''
      return "£(#{string_number.to_f.round(2)})"
    elsif number > 0
      return "£#{number}"
    else
      return "£0"
    end
  end

end
