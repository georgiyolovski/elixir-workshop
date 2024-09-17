defmodule Account do
  @doc """
  Logs in a user based on the provided input.

  There are three types of users: `:admin`, `:employee`, and `:guest`.

  For `:admin` and `:employee`, the input should include:
    - `:email` (string)
    - `:password` (string)

  For `:guest`, the input should include:
    - `:token` (string)

  Returns:
    - `{:ok}` for successful login
    - `{:error}` for unsuccessful login

  ## Examples

      iex> Account.login(%{type: :admin, email: "admin1@example.com", password: "adminPassword123"})
      {:ok}

      iex> Account.login(%{type: :admin, email: "admin1@example.com", password: "wrongPassword"})
      {:error}

      iex> Account.login(%{type: :guest, token: "guest1_token"})
      {:ok}

      iex> Account.login(%{type: :guest, token: "invalid_token"})
      {:error}

      iex> Account.login(%{type: :guest, token: "guest3_token"})
      {:error}

  """
    @database %{
      admin: %{
        "admin1@example.com" => %{
          password: "adminPassword123",
        },
        "admin2@example.com" => %{
          password: "anotherAdminPassword",
        }
      },
      employee: %{
        "employee1@example.com" => %{
          password: "employeePassword123",
        },
        "employee2@example.com" => %{
          password: "differentEmployeePassword",
        }
      },
      guest: %{
        "guest1_token" => %{
          status: :valid,
        },
        "guest2_token" => %{
          status: :valid,
        },
        "guest3_token" => %{
          status: :invalid,
        }
      }
    }

  @spec login(map()) :: {:ok | :error}
  def login(data) do
  end
end

IO.inspect(Account.login(%{type: :admin, email: "admin1@example.com", password: "adminPassword123"})) # {:ok}
IO.inspect(Account.login(%{type: :admin, email: "admin1@example.com", password: "wrongPassword"})) # {:error}
IO.inspect(Account.login(%{type: :employee, email: "employee1@example.com", password: "employeePassword123"})) # {:ok}
IO.inspect(Account.login(%{type: :employee, email: "employee15@example.com", password: "employeePassword123"})) # {:error}
IO.inspect(Account.login(%{type: :employee, email: "employee1@example.com", password: nil})) # {:error}
IO.inspect(Account.login(%{type: :guest, token: "guest1_token"})) # {:ok}
IO.inspect(Account.login(%{type: :guest, token: "guest3_token"})) # {:error} (invalid token)
IO.inspect(Account.login(%{type: nil, email: "admin1@example.com", password: "adminPassword123"})) # {:error}
IO.inspect(Account.login(nil)) # {:error}
