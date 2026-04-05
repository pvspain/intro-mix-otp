defmodule KV do
  @moduledoc """
  Documentation for `KV`.
  """

  use Application
  # The @impl true annotation says we are implementing a callback
  @impl true
  def start(_type, _args) do
    Supervisor.start_link([], strategy: :one_for_one)
  end
end
