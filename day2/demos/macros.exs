defmodule MyApp.Calculator do
  defmacro __using__(opts) do
    if opts[:financial] == true do
        quote do
          def add_money(a, b) do
            "Adding sums of money..."
          end
        end
    end
  end

  def add(a, b), do: a + b
end

defmodule MyApp do
  use MyApp.Calculator, financial: true

  def start() do
    add_money(1, 2)
    |> IO.inspect
  end
end

MyApp.start()
