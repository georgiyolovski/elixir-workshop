defmodule Chat do
  use GenServer

  @impl true
  def init(name) do
    {:ok, %{"name" => name, "history" => []}}
  end

  @impl true
  def handle_cast({:message, {sender, sender_name},  data}, %{"name" => name} = state) do
    IO.puts("(#{name}): Received a message from #{sender_name}: #{data}")

    GenServer.cast(sender, {:received, {self(), state["name"]}, "Thank you for the message, #{sender_name}"})

    {
      :noreply,
      state
      |> Map.update("history", [], fn history -> history ++ [{sender, data}] end)
    }
  end

  def handle_cast({:received, {_receiver, receiver_name}, data}, %{"name" => name} = state) do
    IO.puts("(#{name}): #{receiver_name} received my message and replied with: #{data}")
    {:noreply, state}
  end
end
