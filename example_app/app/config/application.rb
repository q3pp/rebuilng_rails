require "szszfr"
	$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'controllers')
	require 'index_controller'

module MyApp
	class Application < Szszfr::Application

	end
end
