defmodule MyApp.Backend.Repos.Users do
  def get_all() do
    "Here are all the users"
  end
end

defmodule MyApp do
  def start() do
    MyApp.Backend.Repos.Users.get_all()
  end
end

IO.inspect(MyApp.start())
