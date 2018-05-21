defmodule MattdavisWeb.MythController do
	use MattdavisWeb, :controller

	def index(conn, _params) do
	  	IO.puts("**displaying myth page***")
	  	#IO.inspect(Bandstock.GraphicMagic.magic)
	    render conn, "index.html"
	  end
end
