module Szszfr
  class Controller
    require "erubis"

    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub /Controller$/, ""
      Szszfr::Util.to_underscore klass
    end

    def render(view_name, locals = {})
      filename = File.join "app", "views",
      controller_name, "#{view_name}.erb"
      
      template = File.read filename
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(:env => env, variables: instance_variables)
    end
  end
end
