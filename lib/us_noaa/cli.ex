defmodule UsNoaa.CLI do
  require Logger

  def main(argv) do
    argv
      |> parse_args
      |> process
  end

  defp parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      { [help: true], _, _ } -> :help
      { _, [state_id],   _ } -> state_id
      { _, [state_id],   _ } -> state_id
      _                      -> :help
    end
  end

  defp process(:help) do
    IO.puts """
    Usage: us_noaa <state_id>
    """
    System.halt(0)
  end

  defp process(state_id) do
    IO.inspect state_id
    state_id
      |> UsNoaa.XMLFetcher.fetch
  end
end
