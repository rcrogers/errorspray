class Exception

  def append_and_raise(*appends)
    message = self.message
    appends.each do |a|
      s = case a
      when String; a
      when Proc
        a.arity > 0 ? a.call(self) : a.call
      else raise "invalid append object: #{a.inspect}"
      end

      message = case message
      when /\S/
        "#{message}\n    #{s}"
      else
        s
      end
    end
    raise self, message, self.backtrace
  end

end
