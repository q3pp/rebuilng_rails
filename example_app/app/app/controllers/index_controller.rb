class IndexController < Szszfr::Controller
  def text
    "HI MY LITTLE FRIEND"
  end

  def method_missing(method)
    "no route for #{method}"
  end
end
