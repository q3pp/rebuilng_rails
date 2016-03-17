require "szszfr/version"
require "random_user"
require "routing"

module Szszfr

 class Application
 	def call(env)
    if env["PATH_INFO"] == '/favicon.ico'
      [404, {'Content-Type' => 'text/html'},[] ]
    end

    # get controller and action
    klass, action = get_controller_and_action(env)
    controller = klass.new(env)
    text = controller.send(action)

	  [200, {'Content-Type' => 'text/html'},
      ["#{text}<br>Hello, #{RandomUser.name}!<br>#{pp(env)}"]]
    end

   def pp(hash)
    hash.map {|key,value| "#{key} => #{value}"}.sort.join("<br/>")
    end
 end

 class Controller
   def initialize(env)
     @env = env
   end

   def env
     @env
   end
 end

end
