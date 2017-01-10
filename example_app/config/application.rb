require 'szszfr'
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'controllers')

module ExampleApp
	class Application < Szszfr::Application
	end
end
