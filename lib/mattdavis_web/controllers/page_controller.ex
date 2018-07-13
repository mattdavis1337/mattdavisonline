defmodule MattdavisWeb.PageController do
  use MattdavisWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def tutoring(conn, _params) do
    render conn, "tutoring.html"
  end

end
