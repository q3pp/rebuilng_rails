class IndexController < Szszfr::Controller
  def text
    "HI MY LITTLE FRIEND"
  end

  def template
    @fuuuuu = "Yo"
    render 'hello', name: Szszfr::RandomUser.name
  end

  def self.method_missing(method)
    "no route for #{method}"
  end
end
