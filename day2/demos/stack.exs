defmodule Stack do
  use GenServer

  @impl true
  def init(initial_state) do
    {:ok, initial_state}
  end

  @impl true
  def handle_call({:push, element}, _from, state) do
    {:reply, "success", state ++ [element]}
  end

  def handle_call({:pop}, _from, state) do
    [head | tail] = state
    {:reply, head, tail}
  end
end
