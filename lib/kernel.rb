module Kernel

  private
  def raise_append(*appends)
    begin
      yield
    rescue Exception => e
      e.append_and_raise *appends
    end
  end

end
