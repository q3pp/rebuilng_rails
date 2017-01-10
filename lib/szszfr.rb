require 'szszfr/version'
require "szszfr/random_user"
require "szszfr/routing"
require "szszfr/util"
require "szszfr/dependencies"
require "szszfr/controller"
require "szszfr/file_model"

module Szszfr

 class Application
 	def call(env)
    if env["PATH_INFO"] == '/favicon.ico'
      return [404, {'Content-Type' => 'text/html'},[] ]
    end

    if env["PATH_INFO"] == '/'
      return [200, {'Content-Type' => 'text/html'}, [File.read('public/index.html')]]
    end
    # get controller and action
    klass, action = get_controller_and_action(env)

    controller = klass.new(env)
    text = controller.send(action)

	  [200, {'Content-Type' => 'text/html'}, [text] ]
  end

  def pp(hash)
    hash.map {|key,value| "#{key} => #{value}"}.sort.join("<br/>")
  end
 end
end
