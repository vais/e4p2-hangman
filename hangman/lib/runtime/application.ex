defmodule Hangman.Runtime.Application do
  use Application

  @dynamic_supervisor_name GameStarter

  def start(_type, _args) do
    supervisor_spec = [
      {DynamicSupervisor, strategy: :one_for_one, name: @dynamic_supervisor_name}
    ]

    Supervisor.start_link(supervisor_spec, strategy: :one_for_one)
  end

  def start_game do
    DynamicSupervisor.start_child(@dynamic_supervisor_name, {Hangman.Runtime.Server, nil})
  end
end
