module Kernel

  private

  def raise_append(*appenders)
    yield
  rescue Exception => exception
    result_message = exception.message
    appenders.each do |appender|
      append_message = case appender
      when String; appender
      when Proc; appender.call
      else raise "invalid appender: #{appender.inspect}"
      end
      result_message.concat "\n\t#{append_message}" if append_message =~ /\S/
    end
    raise exception, result_message, exception.backtrace
  end

end
