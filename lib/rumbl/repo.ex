defmodule Rumbl.Repo do

  @doc """
  In memory Repository.
  """
  def all(Rumbl.User) do
    [%Rumbl.User{id: "1",name: "Roshan Pisharody", username: "roshanpisharody",password: "elixir"},
     %Rumbl.User{id: "2",name: "Hrithik Pisharody", username: "hrithikpisharody",password: "phoenix"},
     %Rumbl.User{id: "1",name: "Ashish Pisharody", username: "ashishpisharody",password: "erlang"}]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module,params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
